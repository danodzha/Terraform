node {
    git 'https://github.com/danodzha/Terraform.git/'
        stage ('Variable declaration') {
            sh """
            ls
            """
        }
        if(action == 'Deploy') {
        stage('Terraform init') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
                sh """
                terraform init
                """
            }
        }
        stage('Terraform plan') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
            sh label: 'terraform plan', script: "set +x; terraform plan -out=tfplan -input=false -var vcenter_user=${vc_user} -var vcenter_password=${vc_pwd} -var vm_count=${Number_of_VMs}"
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                    input(id: "Deploy Gate", message: "Deploy environment?", ok: 'Deploy')
                    }
                }
            }
        }
        stage('Terraform apply') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
            sh label: 'terraform apply', script: "terraform apply -lock=false -input=false tfplan"
            }
        }
    }
    if(action == 'Destroy') {
        stage('plan_destroy') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
            sh label: 'terraform plan destroy', script: "set +x; terraform plan -destroy -out=tfdestroyplan -input=false -var vcenter_user=${vc_user} -var vcenter_password=${vc_pwd} -var vm_count=${Number_of_VMs}"
            }
        }
        stage('Destroy') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
            script {
                timeout(time: 10, unit: 'MINUTES') {
                input(id: "Destroy Gate", message: "Destroy environment?", ok: 'Destroy')
                }
            }
            sh label: 'Destroy environment', script: "terraform apply -lock=false -input=false tfdestroyplan"
            }
        }
    }
    if(action == 'Show') {
        stage('Terraform init') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
                sh """
                terraform init
                """
            }
        }
        stage('Show state') {
            dir ('terraform-VMware/infras/LinuxVM_clone/') {
            sh label: 'terraform show state', script: "terraform output"
            }
        }     
    }
    stage ('Variable cleanup') {
        sh """
        ls
        """
    }
}
