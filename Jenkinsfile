pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('Init') {
      steps {
        sh '''cd /tmp/TerraformScripts/configuration/vpc
pwd
id
/tmp/terraform init'''
      }
    }
    stage('Plan') {
      steps {
        sh '''cd /tmp/TerraformScripts/configuration/vpc
pwd
/tmp/terraform plan -out tfplan'''
      }
    }
    stage('Apply') {
      steps {
        input(message: 'Do you want to proceed with terraform apply? (Click "Yes" to continue)', ok: 'Yes')
        sh '''cd /tmp/TerraformScripts/configuration/vpc
pwd
echo $TF_VAR_environment
echo $TF_VAR_project_name
/tmp/terraform apply -auto-approve'''
      }
    }
  }
}
