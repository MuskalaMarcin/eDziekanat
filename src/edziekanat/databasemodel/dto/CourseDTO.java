package edziekanat.databasemodel.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "course")
public class CourseDTO implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "stationary")
    private Integer stationary;
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

    public String getName()
    {
	return name;
    }

    public void setName(String name)
    {
	this.name = name;
    }

    public Integer getStationary()
    {
	return stationary;
    }

    public void setStationary(Integer stationary)
    {
	this.stationary = stationary;
    }

    public Integer getFaculty_id()
    {
	return facultyId;
    }

    public void setFaculty_id(Integer faculty_id)
    {
	this.facultyId = faculty_id;
    }
}
