pipeline {
  agent any
  environment{
    setenv PATH "${PATH}:/usr/local/bi
  }
  
  stages {
	    stage('initialize') {
	      steps {
	        sh "echo PATH= ${PATH}"
	      }
	    }
    
	    stage('Run Robot Tests') {
	      steps {
	                sh 'pip install -r requirements.txt'
	                sh 'rfbrowser init'
		        	sh 'python -m robot --NoStatusRC Tests/'
		        	sh 'exit 0'
	      		}
	      post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'reports',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  }
  
}
