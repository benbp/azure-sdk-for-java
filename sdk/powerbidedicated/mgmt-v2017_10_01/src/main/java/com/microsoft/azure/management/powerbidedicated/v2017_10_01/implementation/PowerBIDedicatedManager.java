/**
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 *
 * Code generated by Microsoft (R) AutoRest Code Generator.
 */

package com.microsoft.azure.management.powerbidedicated.v2017_10_01.implementation;

import com.microsoft.azure.AzureEnvironment;
import com.microsoft.azure.AzureResponseBuilder;
import com.microsoft.azure.credentials.AzureTokenCredentials;
import com.microsoft.azure.management.apigeneration.Beta;
import com.microsoft.azure.management.apigeneration.Beta.SinceVersion;
import com.microsoft.azure.arm.resources.AzureConfigurable;
import com.microsoft.azure.serializer.AzureJacksonAdapter;
import com.microsoft.rest.RestClient;
import com.microsoft.azure.management.powerbidedicated.v2017_10_01.Capacities;
import com.microsoft.azure.management.powerbidedicated.v2017_10_01.Operations;
import com.microsoft.azure.arm.resources.implementation.AzureConfigurableCoreImpl;
import com.microsoft.azure.arm.resources.implementation.ManagerCore;

/**
 * Entry point to Azure PowerBIDedicated resource management.
 */
public final class PowerBIDedicatedManager extends ManagerCore<PowerBIDedicatedManager, PowerBIDedicatedManagementClientImpl> {
    private Capacities capacities;
    private Operations operations;
    /**
    * Get a Configurable instance that can be used to create PowerBIDedicatedManager with optional configuration.
    *
    * @return the instance allowing configurations
    */
    public static Configurable configure() {
        return new PowerBIDedicatedManager.ConfigurableImpl();
    }
    /**
    * Creates an instance of PowerBIDedicatedManager that exposes PowerBIDedicated resource management API entry points.
    *
    * @param credentials the credentials to use
    * @param subscriptionId the subscription UUID
    * @return the PowerBIDedicatedManager
    */
    public static PowerBIDedicatedManager authenticate(AzureTokenCredentials credentials, String subscriptionId) {
        return new PowerBIDedicatedManager(new RestClient.Builder()
            .withBaseUrl(credentials.environment(), AzureEnvironment.Endpoint.RESOURCE_MANAGER)
            .withCredentials(credentials)
            .withSerializerAdapter(new AzureJacksonAdapter())
            .withResponseBuilderFactory(new AzureResponseBuilder.Factory())
            .build(), subscriptionId);
    }
    /**
    * Creates an instance of PowerBIDedicatedManager that exposes PowerBIDedicated resource management API entry points.
    *
    * @param restClient the RestClient to be used for API calls.
    * @param subscriptionId the subscription UUID
    * @return the PowerBIDedicatedManager
    */
    public static PowerBIDedicatedManager authenticate(RestClient restClient, String subscriptionId) {
        return new PowerBIDedicatedManager(restClient, subscriptionId);
    }
    /**
    * The interface allowing configurations to be set.
    */
    public interface Configurable extends AzureConfigurable<Configurable> {
        /**
        * Creates an instance of PowerBIDedicatedManager that exposes PowerBIDedicated management API entry points.
        *
        * @param credentials the credentials to use
        * @param subscriptionId the subscription UUID
        * @return the interface exposing PowerBIDedicated management API entry points that work across subscriptions
        */
        PowerBIDedicatedManager authenticate(AzureTokenCredentials credentials, String subscriptionId);
    }

    /**
     * @return Entry point to manage Capacities.
     */
    public Capacities capacities() {
        if (this.capacities == null) {
            this.capacities = new CapacitiesImpl(this);
        }
        return this.capacities;
    }

    /**
     * @return Entry point to manage Operations.
     */
    public Operations operations() {
        if (this.operations == null) {
            this.operations = new OperationsImpl(this);
        }
        return this.operations;
    }

    /**
    * The implementation for Configurable interface.
    */
    private static final class ConfigurableImpl extends AzureConfigurableCoreImpl<Configurable> implements Configurable {
        public PowerBIDedicatedManager authenticate(AzureTokenCredentials credentials, String subscriptionId) {
           return PowerBIDedicatedManager.authenticate(buildRestClient(credentials), subscriptionId);
        }
     }
    private PowerBIDedicatedManager(RestClient restClient, String subscriptionId) {
        super(
            restClient,
            subscriptionId,
            new PowerBIDedicatedManagementClientImpl(restClient).withSubscriptionId(subscriptionId));
    }
}
