public with sharing class ApexSandboxIO
{
    public static Boolean isPrime(Integer num)
    {
        if (num <= 1)
        {
            return false;
        }

        for (Integer i = 2; i <= Math.sqrt(num); i++)
        {
            if (Math.mod(num, i) == 0)
            {
                return false;
            }
        }
        return true;
    }

    public static Integer nextPrime(Integer num)
    {
        Integer result = num;
        if (isPrime(result + 1))
        {
            return result + 1;
        }
        else
        {
            return nextPrime(result + 1);
        }
    }
}