package edziekanat.databasemodel.dao;

import java.util.Collections;
import java.util.List;

import edziekanat.databasemodel.TableNames;
import edziekanat.databasemodel.dto.ApplicationDTO;

/**
 * Data access class used to perform operations on application entities.
 */
public class ApplicationDAO extends DAOParentClass<ApplicationDTO>
{
    public ApplicationDAO()
    {
	super(ApplicationDTO.class, TableNames.APPLICATION);
    }

    /**
     * Method getting one object of Application entity.
     * 
     * @param id Integer id value
     * @return ApplicationDTO object
     */
    public ApplicationDTO getEntity(Integer id)
    {
	return entityManager.find(ApplicationDTO.class, id);
    }

    /**
     * Method getting waiting students applications by studentid
     * @param studentId
     * @return
     */
    public List<ApplicationDTO> getWaitingApplications(Integer studentId)
    {
	List<ApplicationDTO> waitingApplications = getMultipleEntities(
		"student_id = '" + studentId + "' and status = 'Nierozpatrzony'");
	Collections.sort(waitingApplications, (x, y) -> y.getDispatchDate().compareTo(x.getDispatchDate()));
	return waitingApplications;
    }

    /**
     * Method getting all students applications
     * @param studentId
     * @return
     */
    public List<ApplicationDTO> getApplications(Integer studentId)
    {
	List<ApplicationDTO> getApplications = getMultipleEntities(
		"student_id = '" + studentId + "' and status != 'Nierozpatrzony'");
	Collections.sort(getApplications, (x, y) -> y.getDispatchDate().compareTo(x.getDispatchDate()));
	return getApplications;
    }
    
    /**
     * Method getting waiting students applications by studentid
     * @param studentId
     * @return
     */
    public List<ApplicationDTO> getWaitingStudentApplications(Integer studentId)
    {
	List<ApplicationDTO> getApplications = getMultipleEntities(
		"student_id = '" + studentId + "' and status = 'Nierozpatrzony'");
	Collections.sort(getApplications, (x, y) -> y.getDispatchDate().compareTo(x.getDispatchDate()));
	return getApplications;
    }

    /**
     * Method getting all waiting admin applications by adminid
     * @param adminId
     * @return
     */
    public List<ApplicationDTO> getAdminWaitingApplications(Integer adminId)
    {
	List<ApplicationDTO> getApplications = getMultipleEntities(
		"administrator_id = '" + adminId + "' and status = 'Nierozpatrzony'");
	Collections.sort(getApplications, (x, y) -> y.getDispatchDate().compareTo(x.getDispatchDate()));
	return getApplications;
    }
    
    /**
     * Method getting list of historial applications by adminid
     * @param adminId
     * @return
     */
    public List<ApplicationDTO> getAdminHistoricalApplications(Integer adminId)
    {
	List<ApplicationDTO> getApplications = getMultipleEntities(
		"administrator_id = '" + adminId + "' and status != 'Nierozpatrzony'");
	Collections.sort(getApplications, (x, y) -> y.getDispatchDate().compareTo(x.getDispatchDate()));
	return getApplications;
    }
}
