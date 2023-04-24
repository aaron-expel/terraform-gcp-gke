## ORG-LEVEL IAM RESOURCES ##
resource "google_organization_iam_custom_role" "expel_k8s_role" {
  count       = (var.org_id != null && var.project_id == null) ? 1 : 0
  org_id      = var.org_id
  role_id     = var.iam_role_name
  title       = var.iam_role_name
  description = "Grants read-only access to non-sensitive Kubernetes resources"
  permissions = [
    "compute.instanceGroupManagers.get",
    "container.apiServices.get",
    "container.apiServices.getStatus",
    "container.apiServices.list",
    "container.auditSinks.get",
    "container.auditSinks.list",
    "container.backendConfigs.get",
    "container.backendConfigs.list",
    "container.bindings.get",
    "container.bindings.list",
    "container.certificateSigningRequests.get",
    "container.certificateSigningRequests.getStatus",
    "container.certificateSigningRequests.list",
    "container.clusterRoleBindings.get",
    "container.clusterRoleBindings.list",
    "container.clusterRoles.get",
    "container.clusterRoles.list",
    "container.clusters.get",
    "container.clusters.list",
    "container.componentStatuses.get",
    "container.componentStatuses.list",
    "container.controllerRevisions.get",
    "container.controllerRevisions.list",
    "container.cronJobs.get",
    "container.cronJobs.getStatus",
    "container.cronJobs.list",
    "container.csiDrivers.get",
    "container.csiDrivers.list",
    "container.csiNodeInfos.get",
    "container.csiNodeInfos.list",
    "container.csiNodes.get",
    "container.csiNodes.list",
    "container.customResourceDefinitions.get",
    "container.customResourceDefinitions.getStatus",
    "container.customResourceDefinitions.list",
    "container.daemonSets.get",
    "container.daemonSets.getStatus",
    "container.daemonSets.list",
    "container.deployments.get",
    "container.deployments.getScale",
    "container.deployments.getStatus",
    "container.deployments.list",
    "container.endpointSlices.get",
    "container.endpointSlices.list",
    "container.endpoints.get",
    "container.endpoints.list",
    "container.events.get",
    "container.events.list",
    "container.frontendConfigs.get",
    "container.frontendConfigs.list",
    "container.horizontalPodAutoscalers.get",
    "container.horizontalPodAutoscalers.getStatus",
    "container.horizontalPodAutoscalers.list",
    "container.ingresses.get",
    "container.ingresses.getStatus",
    "container.ingresses.list",
    "container.initializerConfigurations.get",
    "container.initializerConfigurations.list",
    "container.jobs.get",
    "container.jobs.getStatus",
    "container.jobs.list",
    "container.mutatingWebhookConfigurations.get",
    "container.mutatingWebhookConfigurations.list",
    "container.namespaces.get",
    "container.namespaces.getStatus",
    "container.namespaces.list",
    "container.networkPolicies.get",
    "container.networkPolicies.list",
    "container.nodes.get",
    "container.nodes.getStatus",
    "container.nodes.list",
    "container.operations.get",
    "container.operations.list",
    "container.persistentVolumeClaims.get",
    "container.persistentVolumeClaims.getStatus",
    "container.persistentVolumeClaims.list",
    "container.persistentVolumes.get",
    "container.persistentVolumes.getStatus",
    "container.persistentVolumes.list",
    "container.petSets.get",
    "container.petSets.list",
    "container.podDisruptionBudgets.get",
    "container.podDisruptionBudgets.getStatus",
    "container.podDisruptionBudgets.list",
    "container.podPresets.get",
    "container.podPresets.list",
    "container.podSecurityPolicies.get",
    "container.podSecurityPolicies.list",
    "container.podTemplates.get",
    "container.podTemplates.list",
    "container.pods.get",
    "container.pods.getStatus",
    "container.pods.list",
    "container.priorityClasses.get",
    "container.priorityClasses.list",
    "container.replicaSets.get",
    "container.replicaSets.getScale",
    "container.replicaSets.getStatus",
    "container.replicaSets.list",
    "container.replicationControllers.get",
    "container.replicationControllers.getScale",
    "container.replicationControllers.getStatus",
    "container.replicationControllers.list",
    "container.resourceQuotas.get",
    "container.resourceQuotas.getStatus",
    "container.resourceQuotas.list",
    "container.roleBindings.get",
    "container.roleBindings.list",
    "container.roles.get",
    "container.roles.list",
    "container.runtimeClasses.get",
    "container.runtimeClasses.list",
    "container.scheduledJobs.get",
    "container.scheduledJobs.list",
    "container.serviceAccounts.get",
    "container.serviceAccounts.list",
    "container.services.get",
    "container.services.getStatus",
    "container.services.list",
    "container.statefulSets.get",
    "container.statefulSets.getScale",
    "container.statefulSets.getStatus",
    "container.statefulSets.list",
    "container.storageClasses.get",
    "container.storageClasses.list",
    "container.storageStates.get",
    "container.storageStates.getStatus",
    "container.storageStates.list",
    "container.storageVersionMigrations.get",
    "container.storageVersionMigrations.getStatus",
    "container.storageVersionMigrations.list",
    "container.thirdPartyObjects.get",
    "container.thirdPartyObjects.list",
    "container.thirdPartyResources.get",
    "container.thirdPartyResources.list",
    "container.tokenReviews.create",
    "container.updateInfos.get",
    "container.updateInfos.list",
    "container.validatingWebhookConfigurations.get",
    "container.validatingWebhookConfigurations.list",
    "container.volumeAttachments.get",
    "container.volumeAttachments.getStatus",
    "container.volumeAttachments.list",
    "container.volumeSnapshotClasses.get",
    "container.volumeSnapshotClasses.list",
    "container.volumeSnapshotContents.get",
    "container.volumeSnapshotContents.getStatus",
    "container.volumeSnapshotContents.list",
    "container.volumeSnapshots.get",
    "container.volumeSnapshots.list",
  ]
}

resource "google_organization_iam_member" "expel_k8s_role_binding" {
  count  = (var.org_id != null && var.project_id == null) ? 1 : 0
  org_id = var.org_id
  role   = google_organization_iam_custom_role.expel_k8s_role[0].name
  member = "serviceAccount:${google_service_account.expel_svc_acct.email}"
}

resource "google_organization_iam_member" "expel_browser_role_binding" {
  count  = (var.org_id != null && var.project_id == null) ? 1 : 0
  org_id = var.org_id
  role   = "roles/browser"
  member = "serviceAccount:${google_service_account.expel_svc_acct.email}"
}

## PROJECT-LEVEL IAM RESOURCES ##
resource "google_project_iam_custom_role" "expel_k8s_role" {
  count       = (var.org_id == null && var.project_id != null) ? 1 : 0
  project     = var.project_id
  role_id     = var.iam_role_name
  title       = var.iam_role_name
  description = "Grants read-only access to non-sensitive Kubernetes resources"
  permissions = [
    "compute.instanceGroupManagers.get",
    "container.apiServices.get",
    "container.apiServices.getStatus",
    "container.apiServices.list",
    "container.auditSinks.get",
    "container.auditSinks.list",
    "container.backendConfigs.get",
    "container.backendConfigs.list",
    "container.bindings.get",
    "container.bindings.list",
    "container.certificateSigningRequests.get",
    "container.certificateSigningRequests.getStatus",
    "container.certificateSigningRequests.list",
    "container.clusterRoleBindings.get",
    "container.clusterRoleBindings.list",
    "container.clusterRoles.get",
    "container.clusterRoles.list",
    "container.clusters.get",
    "container.clusters.list",
    "container.componentStatuses.get",
    "container.componentStatuses.list",
    "container.controllerRevisions.get",
    "container.controllerRevisions.list",
    "container.cronJobs.get",
    "container.cronJobs.getStatus",
    "container.cronJobs.list",
    "container.csiDrivers.get",
    "container.csiDrivers.list",
    "container.csiNodeInfos.get",
    "container.csiNodeInfos.list",
    "container.csiNodes.get",
    "container.csiNodes.list",
    "container.customResourceDefinitions.get",
    "container.customResourceDefinitions.getStatus",
    "container.customResourceDefinitions.list",
    "container.daemonSets.get",
    "container.daemonSets.getStatus",
    "container.daemonSets.list",
    "container.deployments.get",
    "container.deployments.getScale",
    "container.deployments.getStatus",
    "container.deployments.list",
    "container.endpointSlices.get",
    "container.endpointSlices.list",
    "container.endpoints.get",
    "container.endpoints.list",
    "container.events.get",
    "container.events.list",
    "container.frontendConfigs.get",
    "container.frontendConfigs.list",
    "container.horizontalPodAutoscalers.get",
    "container.horizontalPodAutoscalers.getStatus",
    "container.horizontalPodAutoscalers.list",
    "container.ingresses.get",
    "container.ingresses.getStatus",
    "container.ingresses.list",
    "container.initializerConfigurations.get",
    "container.initializerConfigurations.list",
    "container.jobs.get",
    "container.jobs.getStatus",
    "container.jobs.list",
    "container.mutatingWebhookConfigurations.get",
    "container.mutatingWebhookConfigurations.list",
    "container.namespaces.get",
    "container.namespaces.getStatus",
    "container.namespaces.list",
    "container.networkPolicies.get",
    "container.networkPolicies.list",
    "container.nodes.get",
    "container.nodes.getStatus",
    "container.nodes.list",
    "container.operations.get",
    "container.operations.list",
    "container.persistentVolumeClaims.get",
    "container.persistentVolumeClaims.getStatus",
    "container.persistentVolumeClaims.list",
    "container.persistentVolumes.get",
    "container.persistentVolumes.getStatus",
    "container.persistentVolumes.list",
    "container.petSets.get",
    "container.petSets.list",
    "container.podDisruptionBudgets.get",
    "container.podDisruptionBudgets.getStatus",
    "container.podDisruptionBudgets.list",
    "container.podPresets.get",
    "container.podPresets.list",
    "container.podSecurityPolicies.get",
    "container.podSecurityPolicies.list",
    "container.podTemplates.get",
    "container.podTemplates.list",
    "container.pods.get",
    "container.pods.getStatus",
    "container.pods.list",
    "container.priorityClasses.get",
    "container.priorityClasses.list",
    "container.replicaSets.get",
    "container.replicaSets.getScale",
    "container.replicaSets.getStatus",
    "container.replicaSets.list",
    "container.replicationControllers.get",
    "container.replicationControllers.getScale",
    "container.replicationControllers.getStatus",
    "container.replicationControllers.list",
    "container.resourceQuotas.get",
    "container.resourceQuotas.getStatus",
    "container.resourceQuotas.list",
    "container.roleBindings.get",
    "container.roleBindings.list",
    "container.roles.get",
    "container.roles.list",
    "container.runtimeClasses.get",
    "container.runtimeClasses.list",
    "container.scheduledJobs.get",
    "container.scheduledJobs.list",
    "container.serviceAccounts.get",
    "container.serviceAccounts.list",
    "container.services.get",
    "container.services.getStatus",
    "container.services.list",
    "container.statefulSets.get",
    "container.statefulSets.getScale",
    "container.statefulSets.getStatus",
    "container.statefulSets.list",
    "container.storageClasses.get",
    "container.storageClasses.list",
    "container.storageStates.get",
    "container.storageStates.getStatus",
    "container.storageStates.list",
    "container.storageVersionMigrations.get",
    "container.storageVersionMigrations.getStatus",
    "container.storageVersionMigrations.list",
    "container.thirdPartyObjects.get",
    "container.thirdPartyObjects.list",
    "container.thirdPartyResources.get",
    "container.thirdPartyResources.list",
    "container.tokenReviews.create",
    "container.updateInfos.get",
    "container.updateInfos.list",
    "container.validatingWebhookConfigurations.get",
    "container.validatingWebhookConfigurations.list",
    "container.volumeAttachments.get",
    "container.volumeAttachments.getStatus",
    "container.volumeAttachments.list",
    "container.volumeSnapshotClasses.get",
    "container.volumeSnapshotClasses.list",
    "container.volumeSnapshotContents.get",
    "container.volumeSnapshotContents.getStatus",
    "container.volumeSnapshotContents.list",
    "container.volumeSnapshots.get",
    "container.volumeSnapshots.list",
  ]
}

resource "google_project_iam_member" "expel_k8s_role_binding" {
  count   = (var.org_id == null && var.project_id != null) ? 1 : 0
  project = var.project_id
  role    = google_project_iam_custom_role.expel_k8s_role[0].name
  member  = "serviceAccount:${google_service_account.expel_svc_acct.email}"
}

resource "google_project_iam_member" "expel_browser_role_binding" {
  count   = (var.org_id == null && var.project_id != null) ? 1 : 0
  project = var.project_id
  role    = "roles/browser"
  member  = "serviceAccount:${google_service_account.expel_svc_acct.email}"
}
