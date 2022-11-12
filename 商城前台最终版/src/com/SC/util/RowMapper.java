package com.SC.util;

import java.sql.ResultSet;

public interface RowMapper {

    public Object mapRow(ResultSet rs) throws Exception;

}
