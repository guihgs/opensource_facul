<?php include 'inc/header.php'; ?>
<h2 class="page-header"><?php echo $job->job_title; ?> (<?php echo $job->location; ?>)</h2>
<small>Posted By <?php echo $job->contact_user; ?> on <?php echo $job->post_date; ?> </small>
<hr>
<p class="lead"><?php echo $job->description; ?></p>
<ul class="list-group">
	<li class="list-group-item">
		<strong>Empresa:</strong><?php echo $job->company; ?>
	</li>
	<li class="list-group-item">
		<strong>Salario:</strong><?php echo $job->salary; ?>
	</li>
	<li class="list-group-item">
		<strong>Contato:</strong><?php echo $job->contact_email; ?>
	</li>
</ul>
<br><br>
<a href="index.php">Voltar</a>
<br><br>
<div class="well">
	<a class="btn btn-default" href="edit.php?id=<?php echo $job->id; ?>">Editar</a>

	<form style="display: inline;" method="post" action="job.php">
		<input type="hidden" name="del_id" value="<?php echo $job->id; ?>">
		<input type="submit" class="btn btn-danger" value="Deletar">
	</form>
</div>

<?php include 'inc/footer.php'; ?>