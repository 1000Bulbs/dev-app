import { render, screen } from '@testing-library/react';
import App from './App';

test('Renders all the buttons', () => {
  render(<App />);
  const fetchDataSlowlyButton = screen.getByText('Fetch data slowly');
  expect(fetchDataSlowlyButton).toBeInTheDocument();

  const throwApiErrorButton = screen.getByText('Throw API error');
  expect(throwApiErrorButton).toBeInTheDocument();

  const clearFilterButton = screen.getByText('Clear Filter');
  expect(clearFilterButton).toBeInTheDocument();

  const showFizzButton = screen.getByText('Show Fizz');
  expect(showFizzButton).toBeInTheDocument();

  const showBuzzButton = screen.getByText('Show Buzz');
  expect(showBuzzButton).toBeInTheDocument();

  const showFizzBuzzButton = screen.getByText('Show FizzBuzz');
  expect(showFizzBuzzButton).toBeInTheDocument();
});
