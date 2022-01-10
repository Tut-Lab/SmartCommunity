package com.ecenter.system.domain;

import java.io.Serializable;
import java.util.List;

public class RoleTree implements Serializable{

    private static final long serialVersionUID = 1L;

    private String id;

    private String label;

    private List<RoleTreeChildren> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<RoleTreeChildren> getChildren() {
        return children;
    }

    public void setChildren(List<RoleTreeChildren> children) {
        this.children = children;
    }
}

