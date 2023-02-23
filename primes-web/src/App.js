import * as React from 'react';
import { useState } from 'react';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import MultiplicationTable from './MultiplicationTable';

const theme = createTheme();

export default function PrimesTable() {
  const [tableData, setTableData] = useState(null);

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    fetch(`${process.env.PRIMES_API_HOST}/prime_tables/${data.get('n')}`)
      .then((response) => response.json())
      .then((json) => setTableData(json.data));

  };

  return (
    <ThemeProvider theme={theme}>
      <Container component="main" maxWidth="m">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 8,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
          }}
        >
          <Typography component="h1" variant="h5">
            Primes Multiplication Table
          </Typography>
          <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 1 }}>
            <TextField
              margin="normal"
              required
              fullWidth
              id="n"
              label="Number of primes"
              name="n"
              autoFocus
            />
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2 }}
            >
              Generate
            </Button>
            {tableData && <MultiplicationTable data={tableData} />}
          </Box>
        </Box>
      </Container>
    </ThemeProvider>
  );
}
