<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use App\Entity\Product;


class ProductController extends AbstractController
{
   /**
    * @Route("/", name="indexAction")
    */ 
    public  function indexAction()
    {
        $products = $this->getDoctrine()
            ->getRepository(Product::class)
            ->findAll(); // this variable $Names will store the result of running a query to find all the Names
         return $this->render('product/index.html.twig', array("products"=>$products)); // i send the variable that have all the Names as an array of objects to the index.html.twig page
    }

    /**
    * @Route("/create", name="create_page")
    */
    public function createAction(Request $request)
    {
        // Here we create an object from the class that we made
        $product = new Product;
 /* Here we will build a form using createFormBuilder and inside this function we will put our object and then we write add then we select the input type then an array to add an attribute that we want in our input field */
        $form = $this->createFormBuilder($product)
        ->add('name', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
        ->add('image', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
        ->add('price', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
        ->add('location', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
        ->add('date', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
        ->add('time', TimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
         ->add('description', TextAreaType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-bottom:15px')))
         ->add( 'type' , ChoiceType::class, array ( 'choices' => array ( 'Theater' => 'Theater' , 'Concerts' => 'Concerts' , 'Tour' => 'Tour' ), 'attr'  => array ( 'class' => 'form-control w-75' , 'style' => 'margin-botton:15px' )))
        ->add('save', SubmitType::class, array('label'=> 'Create Event', 'attr' => array('class'=> 'btn btn-outline-info mt-3', 'style'=>'margin-bottom:15px')))
        ->getForm();
        $form->handleRequest($request);
        
 
        /* Here we have an if statement, if we click submit and if  the form is valid we will take the values from the form and we will save them in the new variables */
        if($form->isSubmitted() && $form->isValid()){
            //fetching data
 
            // taking the data from the inputs by the name of the inputs then getData() function
            $names = $form['name']->getData();
            $image = $form['image']->getData();
            $price = $form['price']->getData();
            $location = $form['location']->getData();
            $date = $form['date']->getData();
            $time = $form['time']->getData();
            $description = $form['description']->getData();
            $type = $form['type']->getData();
            
            // Here we will get the current date
            // $now = new\DateTime('now');
 
 /* these functions we bring from our entities, every column have a set function and we put the value that we get from the form */
            $product->setName($names);
            $product->setImage($image);
            $product->setPrice($price);
            $product->setLocation($location);
            $product->setDate($date);
            $product->setTime($time);
            $product->setDescription($description);
            $product->setType($type);
            $em = $this->getDoctrine()->getManager();
            $em->persist($product); // build the query  
            $em->flush(); // like you run the query
            $this->addFlash(
                    'success',
                    'name Added'
                    );
            return $this->redirectToRoute('indexAction');
        }
 /* now to make the form we will add this line form->createView() and now you can see the form in create.html.twig file  */
        return $this->render('product/create.html.twig', array('form' => $form->createView()));
    }

    /**
    * @Route("/edit/{id}", name="product_edit")
    */
   public  function editAction( $id, Request $request){
    /* Here we have a variable product and it will save the result of this search and it will be one result because we search based on a specific id */
    $product = $this->getDoctrine()->getRepository('App:Product')->find($id);
    
    /* Now we will use set functions and inside this set functions we will bring the value that is already exist using get function for example we have setName() and inside it we will bring the current value and use it again */
        $product->setName($product->getName());
        $product->setImage($product->getImage());
        $product->setPrice($product->getPrice());
        $product->setLocation($product->getLocation());
        $product->setDate($product->getDate());
        $product->setTime($product->getTime());
        $product->setDescription($product->getDescription());
        $product->setType($product->getType());
        
    /* Now when you type createFormBuilder and you will put the variable product the form will be filled of the data that you already set it */
           $form = $this->createFormBuilder($product)
           ->add('name', TextType::class, array('attr' => array('class'=> 'form-control w-75', 'style'=>'margin-botton:15px')))
           ->add( 'image', TextType::class, array('attr' => array ('class'=> 'form-control w-75', 'style'=> 'margin-bottom:15px')))
           ->add('price', TextType::class, array('attr' => array('class' => 'form-control w-75', 'style'=>'margin-botton:15px' )))
           ->add('location', TextType::class, array('attr' => array('class' => 'form-control w-75', 'style'=>'margin-botton:15px' )))
           ->add('date', TextType::class, array('attr' => array('class' => 'form-control w-75', 'style'=>'margin-botton:15px' )))
           ->add('time', TimeType::class, array('attr' => array('style'=>'margin-bottom:15px')))
           ->add('description', TextAreaType::class, array('attr' => array('class' => 'form-control w-75', 'style'=>'margin-botton:15px' )))
           ->add( 'type' , ChoiceType::class, array ( 'choices' => array ( 'Theater' => 'Theater' , 'Concerts' => 'Concerts' , 'Tour' => 'Tour' ), 'attr'  => array ( 'class' => 'form-control w-75' , 'style' => 'margin-botton:15px' )))
           ->add('save', SubmitType::class, array('label'=> 'Update Event' , 'attr' => array( 'class'=> 'btn btn-outline-info mt-3', 'style' =>'margin-botton:15px')))
           ->getForm();
           $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()){
                //fetching data
               $name = $form[ 'name']->getData();
               $image = $form[ 'image']->getData();
               $price = $form[ 'price']->getData();
               $location = $form[ 'location']->getData();
               $date = $form[ 'date']->getData();
               $time = $form[ 'time']->getData();
               $discription = $form[ 'description']->getData();
               $type = $form[ 'type']->getData();
               $em = $this->getDoctrine()->getManager();
               $product = $em->getRepository( 'App:product')->find($id);
               $product->setName($product->getName());
               $product->setImage($product->getImage());
               $product->setPrice($product->getPrice());
               $product->setLocation($product->getLocation());
               $product->setDate($product->getDate());
               $product->setTime($product->getTime());
               $product->setDescription($product->getDescription());
               $product->setType($product->getType());
               
           
               $em->flush();
                $this->addFlash(
                        'notice',
                        'product Updated'
                       );
                return $this ->redirectToRoute('indexAction' );
           }
           return  $this->render( 'product/edit.html.twig', array( 'product' => $product, 'form' => $form->createView()));
       }

     /**
    * @Route("/details/{productId}", name="detailsAction")
    */ 
    public function showdetailsAction($productId)
    {
        $product = $this->getDoctrine()
            ->getRepository(product::class)
            ->find($productId);
         if (!$product) {
            throw  $this->createNotFoundException(
                 'No name found for id '.$productId
            );
        } else {
                 return $this->render("product/details.html.twig",array("product"=>$product));
                 /*new Response('Option: ' .$productId."<br><img src='" .$product->getImage()."'><br> name name is: ".$product->getProduct(). "<br> costs: " .$product->getPrice()."€ <br>" .$product->getDescription());*/
        }
    }

     /**
    * @Route("/delete/{id}", name="product_delete")
    */
   public function deleteAction($id){
    $em = $this->getDoctrine()->getManager();
    $product = $em->getRepository('App:Product')->find($id);
    $em->remove($product);
    $em->flush();
    $this->addFlash(
       'success',
       'Event Removed'
       );
    return $this->redirectToRoute('indexAction');
    }

    /**
    * @Route("/filter/{type}", name="event_filter")
    */
    public function filter($type){
        $products = $this->getDoctrine()->getRepository('App:Product')->findByType($type);
        return $this ->render('product/index.html.twig', array('products'=>$products));
}

}
