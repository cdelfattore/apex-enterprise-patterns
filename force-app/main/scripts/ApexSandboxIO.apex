// apexsandbox.io

Integer num = 3;
while (true)
{
    // if (Math.mod(num, 2)) continue;
    
    for (Integer i = 0; i < num; i++)
    {
        if (Math.mod(num, i) == 0)
        {
            System.debug('Number is not prime');
        }
    }
}

System.debug(result);
