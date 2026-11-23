pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'DEPLOY', 
            defaultValue: false, 
            description: 'Zaznacz, aby uruchomić etap wdrożenia'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/PeterPorzuczek/TimeRiddle.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Budowanie projektu...'
            }
        }

        stage('Test') {
            steps {
                echo 'Uruchamianie testów...'
            }
        }

        stage('Deploy') {
            when {
                expression { params.DEPLOY == true }
            }
            steps {
                echo 'Wdrażanie aplikacji...'
            }
        }
    }
}
