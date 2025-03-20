public with sharing class ApexSandboxIO
{
    public static Boolean isPrime(Integer num)
    {
        for (Integer i = 2; i <= Math.ceil(Math.sqrt(num)); i++)
        {
            System.debug(i);
            if (Math.mod(num, i) == 0)
            {
                return false;
            }
        }
        return true;
    }

    public static Integer nextPrime(Integer num)
    {
        Integer result;
        Boolean con = true;
        while (con)
        {
            
        }

        return result;
    }
}