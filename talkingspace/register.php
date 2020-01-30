<?php require('core/init.php'); ?>
<?php
//Create Topic Object
$topic=new Topic;

//Create User Object

$user=new User;

//Create Validator Object
$validate= new Validator;

if(isset($_POST['register']))
{
    //Create data Array
    $data=array();
    $data['name']=$_POST['name'];
    $data['email']=$_POST['email'];
    $data['username']=$_POST['username'];
    $data['password']=md5($_POST['password']);
    $data['password2']=md5($_POST['password2']);
    $data['about']=$_POST['about'];
    $data['last_activity']=date("Y-m-d H:i:s");

    //Reguired Fields
    $field_array=array('name','email','username','password','password2');
    if($validate->isRequired($field_array))
    {
        if($validate->isValidEmail($date['email']))
        {
            if($validate->passwordsMatch($date['password'], $date['password2']))
            {
                //Upload Avatar Image
                if($user->uploadAvatar())
                {
                    $data['avatar']=$FILES["avatar"]["name"];
                }
                else
                {
                    $data['avatar']='noimage.png';
                }
                //Register User

                if($user->register($data))
                {
                    redirect('index.php', 'You are registered and now log in', 'success');
                }
                else
                {
                    redirect('index.php', 'Something went wrong', 'error');
                }

            }
            else
            {
                redirect('register.php', 'Your passwords did not match','error');
            }
        }
        else
        {
            redirect('register.php', 'Your Email address is not ok','error');
        }
    }
    else
    {
        redirect('register.php', 'Please file in all blanks','error');
    }

    
    
}



$template= new Template('templates/register.php');

echo $template;

?>