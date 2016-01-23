package edziekanat.databasemodel.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import edziekanat.databasemodel.TableNames;

@Entity
@Table(name = TableNames.TRANSCRIPT)
public class TranscriptDTO implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name = "TRANSCRIPTSEQ", sequenceName = "transcript_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TRANSCRIPTSEQ")
    @Column(name = "id")
    private Integer id;
    @Temporal(TemporalType.DATE)
    @Column(name = "issue_date")
    private Date issueDate;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id")
    private StudentDTO student;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn(name = "students_group_id")
    private StudentsGroupDTO studentsGroup;
    @OneToMany(mappedBy = "transcript", fetch = FetchType.LAZY)
    private List<EnrollmentDTO> enrollment;

    public Integer getId()
    {
	return id;
    }

    public void setId(Integer id)
    {
	this.id = id;
    }

    public Date getIssueDate()
    {
	return issueDate;
    }

    public void setIssueDate(Date issue_date)
    {
	this.issueDate = issue_date;
    }

    public StudentDTO getStudent()
    {
	return student;
    }

    public void setStudent(StudentDTO student)
    {
	this.student = student;
    }

    public StudentsGroupDTO getStudentsGroup()
    {
	return studentsGroup;
    }

    public void setStudentsGroup(StudentsGroupDTO studentsGroup)
    {
	this.studentsGroup = studentsGroup;
    }

    public List<EnrollmentDTO> getEnrollment()
    {
	return enrollment;
    }

    public void setEnrollment(List<EnrollmentDTO> enrollment)
    {
	this.enrollment = enrollment;
    }

}
