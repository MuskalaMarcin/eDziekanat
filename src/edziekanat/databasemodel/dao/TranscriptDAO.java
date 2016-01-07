package edziekanat.databasemodel.dao;

import edziekanat.databasemodel.dto.TranscriptDTO;

/**
 * Data access class used to perform operations on transcript entities.
 */
public class TranscriptDAO extends DAOParentClass<TranscriptDTO>
{
    /**
     * Method getting one object of Transcript entity.
     * 
     * @param id Integer id value
     * @return TranscriptDTO object
     */
    public TranscriptDTO getEntity(Integer id)
    {
	return entityManager.find(TranscriptDTO.class, id);
    }
}
