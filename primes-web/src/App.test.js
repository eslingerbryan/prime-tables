import { fireEvent, render, screen, waitFor } from '@testing-library/react';
import nock from 'nock';
import App from './App';

test('renders input form', () => {
  render(<App />);
  const buttonElement = screen.getByText(/generate/i);
  const inputFieldElement = screen.getByLabelText(/number of primes/i);
  expect(buttonElement).toBeInTheDocument();
  expect(inputFieldElement).toBeInTheDocument();
});

test('renders table after clicking generate', async () => {
  render(<App />);
  const inputFieldElement = screen.getByLabelText(/number of primes/i);
  const buttonElement = screen.getByText(/generate/i);
  nock(process.env.PRIMES_API_HOST)
    .get('/prime_tables/2')
    .once()
    .reply(200, {
      data: [[null, 2, 3], [2, 4, 6], [3, 6, 9]],
    });

  expect(screen.queryByTestId('multiplication-table')).not.toBeInTheDocument();

  

  fireEvent.change(inputFieldElement, {target: {value: '2'}})
  fireEvent.click(buttonElement);

  await waitFor(() => screen.getByTestId('multiplication-table'))
  expect(screen.queryByTestId('multiplication-table')).toBeInTheDocument();
});