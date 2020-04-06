pipeline {
    agent none

    stages {
        stage('Tests') {
            when {
                branch 'master'
            }
            environment {
                STAGE='prod'
            }
            agent {
                ecs {
                   cloud 'jenkins-slave-ecs'
                   image 'jportasa/newrelic-go:1.0'
                   launchType 'FARGATE'
                   memory 1024
                   cpu 256
                   subnets('subnet-08086cbe2d97a1ff1')
                   securityGroups('sg-08f3f54702fb3992e')
                   taskrole 'arn:aws:iam::953835556803:role/ecsTaskExecutionRole'
                   executionRole 'arn:aws:iam::953835556803:role/ecsTaskExecutionRole'
                   assignPublicIp true
                   logDriver 'aswlogs'
                   logDriverOptions([[name: 'awslogs-region', value:'us-east-1'], [name: 'awslogs-group', value: 'jenkins-slave'], [name: 'awslogs-stream-prefix', value: 'alpine']])

                }
            }
            steps {
                sh '''
                    echo pwd
                   '''

            }
        }
    }
}