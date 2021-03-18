Rails.application.routes.draw do



  # Routes for the Outfit resource:

  # CREATE
  post("/insert_outfit", { :controller => "outfits", :action => "create" })

  post("/insert_tops_into_outfit_show", { :controller => "outfits", :action => "tops_into_outfit_show"})
  post("/insert_bottoms_into_outfit_show", { :controller =>"outfits", :action => "bottoms_into_outfit_show"})
  post("/insert_shoes_into_outfit_show", { :controller =>"outfits", :action => "shoes_into_outfit_show"})      
  # READ
  get("/outfits", { :controller => "outfits", :action => "index" })
  
  get("/outfits/:path_id", { :controller => "outfits", :action => "show" })
  
  # UPDATE
  
  post("/modify_outfit/:path_id", { :controller => "outfits", :action => "update" })
  
  # DELETE
  get("/delete_outfit/:path_id", { :controller => "outfits", :action => "destroy" })

  #------------------------------

  # Routes for the Shoe resource:

  # CREATE
  post("/insert_shoe", { :controller => "shoes", :action => "create" })
          
  # READ
  get("/shoes", { :controller => "shoes", :action => "index" })
  
  get("/shoes/:path_id", { :controller => "shoes", :action => "show" })
  
  # UPDATE
  
  post("/modify_shoe/:path_id", { :controller => "shoes", :action => "update" })
  
  # DELETE
  get("/delete_shoe/:path_id", { :controller => "shoes", :action => "destroy" })

  #------------------------------

  # Routes for the Bottom resource:

  # CREATE
  post("/insert_bottom", { :controller => "bottoms", :action => "create" })
          
  # READ
  get("/bottoms", { :controller => "bottoms", :action => "index" })
  
  get("/bottoms/:path_id", { :controller => "bottoms", :action => "show" })
  
  # UPDATE
  
  post("/modify_bottom/:path_id", { :controller => "bottoms", :action => "update" })
  
  # DELETE
  get("/delete_bottom/:path_id", { :controller => "bottoms", :action => "destroy" })

  #------------------------------

  # Routes for the Top resource:

  # CREATE
  post("/insert_top", { :controller => "tops", :action => "create" })
          
  # READ
  get("/tops", { :controller => "tops", :action => "index" })
  
  get("/tops/:path_id", { :controller => "tops", :action => "show" })
  
  # UPDATE
  
  post("/modify_top/:path_id", { :controller => "tops", :action => "update" })
  
  # DELETE
  get("/delete_top/:path_id", { :controller => "tops", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
