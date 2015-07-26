package com.richardhell.petclinic.helper;

import java.util.List;

public interface GenericDAO<T> {

    public T find(T t);

    public List<T> all();

    public void saveDAO(T t);

    public void updateDAO(T t);
    
    public void deleteDAO(T t);
    
}
