#!/bin/bash

# gh cli's token needs to be able to admin enterprise - run this first if it can't
# gh auth refresh -h github.com -s admin:enterprise

gh api graphql --paginate -f enterpriseName='fasttrack-ghec' -f query='
query getEnterpriseIpAllowList($enterpriseName: String! $endCursor: String) {
  enterprise(slug: $enterpriseName) {
    ownerInfo {
      admins(first: 100, after: $endCursor) {
        nodes {
          login
        }
        pageInfo {
          endCursor
          hasNextPage
        }
      }
      allowPrivateRepositoryForkingSetting
      allowPrivateRepositoryForkingSettingPolicyValue
      defaultRepositoryPermissionSetting
      domains(first: 100, after: $endCursor) {
        nodes {
          domain
          isApproved
          isVerified
        }
        pageInfo {
          endCursor
          hasNextPage
        }
      }
      ipAllowListEnabledSetting
      ipAllowListForInstalledAppsEnabledSetting
      ipAllowListEntries(first: 100, after: $endCursor) {
        nodes {
          allowListValue
          isActive
        }
        pageInfo {
          endCursor
          hasNextPage
        }
      }
      isUpdatingDefaultRepositoryPermission
      isUpdatingTwoFactorRequirement
      membersCanChangeRepositoryVisibilitySetting
      membersCanCreateInternalRepositoriesSetting
      membersCanCreatePrivateRepositoriesSetting
      membersCanCreatePublicRepositoriesSetting
      membersCanCreateRepositoriesSetting
      membersCanDeleteIssuesSetting
      membersCanDeleteRepositoriesSetting
      membersCanInviteCollaboratorsSetting
      membersCanMakePurchasesSetting
      membersCanUpdateProtectedBranchesSetting
      membersCanViewDependencyInsightsSetting
      notificationDeliveryRestrictionEnabledSetting
      oidcProvider { # double check this
        providerType
        tenantId
      }
      organizationProjectsSetting
      repositoryProjectsSetting
      samlIdentityProvider { # double check this
        digestMethod
        externalIdentities(first: 100, after: $endCursor) {
          nodes {
            samlIdentity {
              nameId
            }
          }
          pageInfo {
            endCursor
            hasNextPage
          }
        }
        idpCertificate
        issuer
        signatureMethod
        ssoUrl
      }
      # supportEntitlements # fix
      teamDiscussionsSetting
      twoFactorRequiredSetting
    }
  }
}'
