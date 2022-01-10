package com.ruoyi.system.domain;

import java.io.Serializable;

public class RoleTreeChildren implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String label;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

}
