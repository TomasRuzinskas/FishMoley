<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Fishmoley Store</title>
        <%@include file="includes/styleandscripts.jsp" %>
    </head>
    <body>

        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>
<%@include file="includes/nav.jsp" %>


        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="images/thegames.jpg" alt="games">
                                <div class="carousel-caption">
                                    <h3>Games$</h3>
                                    <p>Gimme Gimme.</p>
                                </div>      
                            </div>

                            <div class="item">
                                <img src="images/consoles.jpg" alt="consoles">
                                <div class="carousel-caption">
                                    <h3>Consoles $</h3>
                                    <p>EZ Clap</p> 
                                </div>      
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>



                
                <div class="container">    
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/deals.jpg" class="img-responsive" style="width:100%" alt="deals"></div>
                                <div class="panel-footer">Top PS4 Games</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-danger">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/xboxgames.jpg" class="img-responsive" style="width:100%" alt="xbox games"></div>
                                <div class="panel-footer">Top Xbox Games</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-success">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/pcgames.jpg" class="img-responsive" style="width:100%" alt="pc games"></div>
                                <div class="panel-footer">Top PC Games</div>
                            </div>
                        </div>
                    </div>
                </div><br>

                <div class="container">    
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                    </div>
                </div><br><br>

                <footer class="container-fluid text-center">
                    <p>Online Store Copyright</p>  
                    <form class="form-inline">Get deals:
                        <input type="email" class="form-control" size="50" placeholder="Email Address">
                        <button type="button" class="btn btn-danger">Sign Up</button>
                    </form>
                </footer>

                </body>
                </html>
