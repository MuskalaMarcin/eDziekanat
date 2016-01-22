package edziekanat.databasemodel.dao;

import java.util.LinkedList;
import java.util.List;

import edziekanat.databasemodel.TableNames;
import edziekanat.databasemodel.dto.EnrollmentDTO;
import edziekanat.databasemodel.dto.TranscriptDTO;

/**
 * Data access class used to perform operations on enrollment entities.
 */
public class EnrollmentDAO extends DAOParentClass<EnrollmentDTO>
{
    public EnrollmentDAO()
    {
	super(EnrollmentDTO.class, TableNames.ENROLLMENT);
    }

    /**
     * Method getting one object of Enrollment entity.
     * 
     * @param id Integer id value
     * @return EnrollmentDTO object
     */
    public EnrollmentDTO getEntity(Integer id)
    {
	return entityManager.find(EnrollmentDTO.class, id);
    }

    public List<EnrollmentDTO> getAllStudentEnrollments(Integer studentId)
    {
	List<EnrollmentDTO> allEnrollments = new LinkedList<EnrollmentDTO>();
	for (TranscriptDTO transcript : new StudentDAO().getEntity(studentId).getTranscript())
	{
	    for (EnrollmentDTO enrollment : transcript.getEnrollment())
	    {
		allEnrollments.add(enrollment);
	    }
	}
	return allEnrollments;
    }

    public List<EnrollmentDTO> getEnrollmentsFromSemester(Integer studentId, Integer semester)
    {
	List<EnrollmentDTO> selectedEnrollments = getAllStudentEnrollments(studentId);
	for (int i = 0; i < selectedEnrollments.size(); i++)
	{
	    if (selectedEnrollments.get(i).getSubject().getSemester().compareTo(semester) != 0)
	    {
		selectedEnrollments.remove(i);
		i--;
	    }
	}
	return selectedEnrollments;
    }
}
