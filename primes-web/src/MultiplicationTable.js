import * as React from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

export default function MultiplicationTable({data}) {
	return (
		<TableContainer data-testid="multiplication-table" component={Paper}>
      <Table sx={{ minWidth: 650, th: { backgroundColor: "black", color: "white" } }} size="small" aria-label="prime numbers multiplication table">
        <TableHead>
          <TableRow>
            {data[0].map((el) => <TableCell key={el} component="th"> {el} </TableCell>)}
          </TableRow>
        </TableHead>
        <TableBody>
          {data.slice(1).map((row) => (
            <TableRow
              key={row[0]}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row[0]}
              </TableCell>
              {row.slice(1).map((el) => <TableCell key={el}>{el}</TableCell>)}
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  )
}