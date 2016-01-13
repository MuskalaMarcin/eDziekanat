package edziekanat.databasemodel.dao;

import edziekanat.databasemodel.TableNames;
import edziekanat.databasemodel.dto.ClassroomDTO;

/**
 * Data access class used to perform operations on classroom entities.
 */
public class ClassroomDAO extends DAOParentClass<ClassroomDTO>
{
    
    public ClassroomDAO()
    {
	super(ClassroomDTO.class, TableNames.CLASSROOM);
    }

    /**
     * Method getting one object of Classroom entity.
     * 
     * @param id Integer id value
     * @return ClassroomDTO object
     */
    public ClassroomDTO getEntity(Integer id)
    {
	return entityManager.find(ClassroomDTO.class, id);
    }
}
