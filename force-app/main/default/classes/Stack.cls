public class Stack {
    private List<Object> stack = new List<Object>();
    
    public void push(Object obj)
    {
        // stack.add(size(), obj);
        stack.add(obj);
    }
    
    public Object pop()
    {
        if (size() - 1 >= 0)
        {
            return stack.remove(size() - 1);
        }
        return null;
    }
    
    public Integer size()
    {
        return stack.size();
    }
    
    public Object peek()
    {
        if (!isEmpty())
        {
            return stack.get(size() - 1);
        }

        return null;
    }
    
    public Boolean isEmpty() {
        return stack.size() == 0 ? true : false;
    }
}