\title{Chapter 0}

\section{Exercises}

\begin{code}
module Chapter0 where

import Control.Monad (guard)
\end{code}

\begin{code}
isPrime :: Integer -> Bool
isPrime k = null [ x | x <- [2..k - 1], k `mod`x  == 0]
\end{code}

\subsection{Exercise 1}
\subsection{Exercise 1a}

We know from the proof of Conjecture 2 that if n is not prime, then 2^n - 1 is
also not prime.

In our case n is 15. 15 is not prime (factors 5, 3), therefore 2^15 - 1 is also
not prime.

We also know from the proof of Conjecture 2 that 2^n - 1 will have two factors
x and y such that:
  xy = 2^n - 1
  x = (2^b - 1), where b is one of the factors of n.

In our case, n is 15 and b is 5, so:
  x = (2^5 - 1) = 31
  y = (2^15 - 1)/31 = 1,057

That is: 2^15 - 1 = 32767 = 31 * 1057

\subsection{Exercise 1b}

We know that 32,767 is not prime (from the previous answer) and so by the proof
of Conjecture 2, one of the factors of 2^32767 - 1 should be 2^b - 1, where b is
one of the factors of 32767.

Choosing 1057 for our b will result in a very large number, so we choose 31 as
our b:
  2^31 - 1 = 2,147,483,647

That is, the x that satisfies the conditions is 2,147,483,647.

\subsection{Exercise 2}

\begin{code}
tuples n = (isPrime n, isPrime (3^n -1), isPrime (3^n - 2^n))

exc2 :: [(Bool, Bool, Bool)]
exc2 = do
  n <- [2..10]
  pure $ (isPrime n, isPrime (3^n - 1), isPrime (3^n - 2^n))
\end{code}

[(True,  False, True),
 (True,  False, True),
 (False, False, False),
 (True,  False, True),
 (False, False, False),
 (True,  False, False),
 (False, False, False),
 (False, False, False),
 (False, False, False)]

Conjecture: 3^n - 1 is never prime for any positive integer greater than 1.

\subsection{Exercise 3}
\subsection{Exercise 3a}

Using the proof of Theorem 3:
  m = 2*3*5*7 + 1
  m = 211

\subsection{Exercise 3b}
  m = 2 + 1
    = 3

\subsection{Exercise 4}

\begin{code}
fact :: (Num a, Eq a) => a -> a
fact 1 = 1
fact n = n * (fact $ n - 1)

consecutiveNumsNotPrime :: Integer -> [(Integer, Bool)]
consecutiveNumsNotPrime n = do
  let start = fact (n + 1) + 2

  x <- [start..start + 4]
  pure $ (x, isPrime x)

exc4 = consecutiveNumsNotPrime 5
\end{code}

\subsection{Exercise 5}

\begin{code}
perfectNumbers :: [Integer]
perfectNumbers = do
  n <- [1..10]
  guard (isPrime (2^n - 1))
  pure $ (2^(n - 1))*(2^n - 1)
\end{code}

The next two perfect numbers in this sequence are 496 and 8128.

\subsection{Exercise 6}

\begin{code}
chunkThree :: [a] -> [(a, a, a)]
chunkThree (a : b : c : xs) = (a, b, c) : chunkThree (b : c : xs)
chunkThree (a : b : []) = []
chunkThree (a : []) = []
chunkThree [] = []

primes :: [Integer]
primes = do
  n <- [2..3000]
  guard (isPrime n)
  pure $ n

findTripletPrimes :: [Integer] -> [(Integer, Integer, Integer)]
findTripletPrimes primes =
  filter onlyTriplets . chunkThree $ primes
  where
    onlyTriplets (a, b, c) = (abs (a - b) == 2 && abs (b - c) == 2)
\end{code}

Was not able to determine, but for the prime numbers up to 3000 there are no
more triplet primes.
