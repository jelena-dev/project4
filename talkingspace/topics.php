<?php require('core/init.php'); ?>
<?php
$topic= new Topic;
//Get category From URL
$category=isset($_GET['category']) ? $_GET['category'] : null;

$user_id=isset($_GET['user']) ? $_GET['user'] : null;


$template= new Template('templates/topics.php');

//Assign Vars
if(isset($category))
{
    $template->topics=$topic->getByCategory($category);
    $template->title='Posts In"' .$topic->getCategory($category)->name.'"';

}

if(isset($user_id))
{
    $template->topics=$topic->getByUser($user_id);
    //$template->title='Posts By"' .$user->getUser($user_id)->username.'"';

}
if(!isset($category) && !isset($user_id))
{
    $template->topics=$topic->getALLTopics();
}


$template->totalTopics=$topic->getTotalTopics();
$template->totalCategories=$topic->getTotalCategories();


echo $template;

?>