pipeline {
    agent any
		
	environment {
		scannerHome = tool name: 'sonar_scanner_dotnet'
		registry = 'surabhirathore'
		username = 'sonar-surabhirathore'
        appName = 'NAGPDevOpsProject'
   	}	
   	
    
    stages {
        
    	stage ("Nuget restore") {
            steps {
		    
                //Initial message
                echo "Deployment pipeline started for  branch"
		        checkout scm
                echo "Nuget Restore step"
                bat "dotnet restore"
            }
        }
		
		
       stage('Code build') {
      steps {
        //Cleans the output of the project
        echo "Clean Previous Build"
        bat "dotnet clean"

        //Builds the project and all its dependencies
        echo "Code Build"
        bat 'dotnet build --configuration Release"'
      }
    }       	

    stage ("Release artifact") {
           

            steps {
                echo "Release artifact step"
                bat "dotnet publish -c Release -o ${appName}/app/${userName}"
            }
        }    
}
}

