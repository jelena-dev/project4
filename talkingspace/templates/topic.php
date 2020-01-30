<?php require_once('includes/header.php'); ?>
						<ul id="topics">
					<li id="main-topic" class="topic topic">
						<div class="row">
							<div class="col-md-2">
								<div class="user-info">
									<img class="avatar pull-left" src="<?php echo BASE_URL; ?>images/avatars/<?php echo $topic->avatar; ?>" />
									<ul>
										<li><strong><?=$topic->username; ?></strong></li>
										<li><?=userPostCount($topic->user_id); ?> Posts</li>
										<li><a href="<?php BASE_URL;?>topics.php?user=<?=$topic->user_id; ?>">View topics</a>
									</ul>
								</div>
							</div>
							<div class="col-md-10">
								<div class="topic-content pull-right">
									<?=$topic->body; ?>
								</div>
							</div>
						</div>
					</li>
					<?php foreach($replies as $reply) : ?>
					<li class="topic topic">
						<div class="row">
							<div class="col-md-2">
								<div class="user-info">
									<img class="avatar pull-left" src="<?php BASE_URL; ?>images/avatars/<?=$reply->avatar; ?>" />
									<ul>
										<li><strong><?=$reply->username; ?></strong></li>
										<li><?=userPostCount($topic->user_id); ?> Posts</li>
										<li><a href="<?php BASE_URL;?>topics.php?user=<?=$topic->user_id; ?>">View topics</a>
									</ul>
								</div>
							</div>
							<div class="col-md-10">
								<div class="topic-content pull-right">
								<?php echo $reply->body; ?>
								</div>
							</div>
						</div>
					</li>
                   <?php endforeach; ?>
					
				</ul>

				<h3>Reply To Topic</h3>
				<?php if(isLoggedIn()) : ?>
				<form role="form" method="post" action="topic.php<?=$topic->id; ?>">				
  					<div class="form-group">
						<textarea id="reply" rows="10" cols="80" class="form-control" name="body"></textarea>
						<script>
							CKEDITOR.replace( 'reply' );
            			</script>
  					</div>
 					 <button name="do_reply" type="submit" class="btn btn-default">Submit</button>
				</form>
				<?php else : ?>
				<p>Please log in to reply</p>
               <?php endif; ?>
					<?php require_once('includes/footer.php'); ?>