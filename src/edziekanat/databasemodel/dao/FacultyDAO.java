package edziekanat.databasemodel.dao;

import edziekanat.databasemodel.TableNames;
import edziekanat.databasemodel.dto.FacultyDTO;

/**
 * Data access class used to perform operations on faculty entities.
 */
public class FacultyDAO extends DAOParentClass<FacultyDTO>
{
    public FacultyDAO()
    {
	super(FacultyDTO.class, TableNames.FACULTY);
    }

    /**
     * Method getting one object of Faculty entity.
     * 
     * @param id Integer id value
     * @return FacultyDTO object
     */
    public FacultyDTO getEntity(Integer id)
    {
	return entityManager.find(FacultyDTO.class, id);
    }
}
