// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// Code generated by Microsoft (R) AutoRest Code Generator.

package com.azure.resourcemanager.sql.fluent.models;

import com.azure.core.annotation.Fluent;
import com.azure.core.annotation.JsonFlatten;
import com.azure.core.management.ProxyResource;
import com.azure.core.util.logging.ClientLogger;
import com.azure.resourcemanager.sql.models.TransparentDataEncryptionStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

/** Represents a database transparent data encryption configuration. */
@JsonFlatten
@Fluent
public class TransparentDataEncryptionInner extends ProxyResource {
    @JsonIgnore private final ClientLogger logger = new ClientLogger(TransparentDataEncryptionInner.class);

    /*
     * Resource location.
     */
    @JsonProperty(value = "location", access = JsonProperty.Access.WRITE_ONLY)
    private String location;

    /*
     * The status of the database transparent data encryption.
     */
    @JsonProperty(value = "properties.status")
    private TransparentDataEncryptionStatus status;

    /**
     * Get the location property: Resource location.
     *
     * @return the location value.
     */
    public String location() {
        return this.location;
    }

    /**
     * Get the status property: The status of the database transparent data encryption.
     *
     * @return the status value.
     */
    public TransparentDataEncryptionStatus status() {
        return this.status;
    }

    /**
     * Set the status property: The status of the database transparent data encryption.
     *
     * @param status the status value to set.
     * @return the TransparentDataEncryptionInner object itself.
     */
    public TransparentDataEncryptionInner withStatus(TransparentDataEncryptionStatus status) {
        this.status = status;
        return this;
    }

    /**
     * Validates the instance.
     *
     * @throws IllegalArgumentException thrown if the instance is not valid.
     */
    public void validate() {
    }
}