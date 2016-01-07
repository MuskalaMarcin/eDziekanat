package edziekanat.databasemodel.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import edziekanat.databasemodel.TableNames;

@Entity
@Table(name = TableNames.CLASSROOM)
public class ClassroomDTO implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "capacity")
    private Integer capacity;
    @Column(name = "type")
    private String type;
    @Column(name = "faculty_id")
    private Integer facultyId;

    public Integer getId()
    {
	return id;
    }

    public void setId(Integer id)
    {
	this.id = id;
    }

    public Integer getCapacity()
    {
	return capacity;
    }

    public void setCapacity(Integer capacity)
    {
	this.capacity = capacity;
    }

    public String getType()
    {
	return type;
    }

    public void setType(String type)
    {
	this.type = type;
    }

    public Integer getFacultyId()
    {
	return facultyId;
    }

    public void setFacultyId(Integer faculty_id)
    {
	this.facultyId = faculty_id;
    }
}
