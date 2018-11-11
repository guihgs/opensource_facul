<?php include_once 'config/init.php'; ?>

<?php
$job = new Job;

if(isset($_POST['del_id'])){
	$del_id = $_POST['del_id'];
	if($job->delete($del_id)){
		redirect('index.php', 'Vaga Deletada', 'sucesso');
	}else{
		redirect('index.php', 'Vaga Não foi Deletada', 'error');
	}
}else{

}

$template = new Template('templates/job-single.php');

$job_id = isset($_GET['id']) ? $_GET['id'] : null;

$template->job = $job->getJob($job_id);

echo $template;