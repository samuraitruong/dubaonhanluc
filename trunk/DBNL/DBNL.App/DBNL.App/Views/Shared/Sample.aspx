<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BO.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Sample
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mainTabs" >

              <!-- ****************** MAIN TABS MENU ****************** -->
              <ul id="mainTabsMenu">
                <li><a href="#mainTab-1" onclick="this.blur();">My Tasks</a></li>
                <li><a href="#mainTab-2" onclick="this.blur();">My notes</a></li>
                <li><a href="#mainTab-3" onclick="this.blur();">My messages</a></li>
                <li><a href="#mainTab-4" onclick="this.blur();">My forms</a></li>
                <li><a href="#mainTab-5" onclick="this.blur();">My tables</a></li>
              </ul>
              <div class="clear"></div>
  
              <!-- ****************** MAIN TAB CONTENT 1 ****************** -->
              <div id="mainTab-1">

                <!-- ****************** SUB TABS MENU ****************** -->
                <div id="insideTabs">
                  <ul id="insideTabsMenu">
                      <li><a href="#insideTab-1" onclick="this.blur();">tab 1</a></li>
                      <li><a href="#insideTab-2" onclick="this.blur();">tab 2</a></li>
                      <li><a href="#insideTab-3" onclick="this.blur();">tab 3</a></li>
                  </ul>
                  <div id="insideTabsMenuArrow"></div>

                  <!-- ****************** SUB TAB 1 CONTETN ****************** -->
                  <div id="insideTab-1">
                    <h3>Welcome to the Projectic!</h3>
                    <a href="#" title="Buy this template now" class="blue-button">My big blue button</a>
                    <p class="mb-4x w-50p">This theme is an admin skin for simple project administration. Built with <strong>valid xhtml + css</strong> it contains styling ot the elements like calendar, tables, forms, messages, etc. to help keep your tasks nicely organized.</p>
                    <table id="latestTasks">
                      <caption>Latest tasks</caption>
                      <tr>
                        <th>Task name</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Hour</th>
                        <th>Edit</th>
                        <th>Delete</th>
                      </tr>
                      <tr>
                        <td><a href="default.htm" title="">My first task</a></td>
                        <td>To finish the project and send the mockups</td>
                        <td>18.1.2010</td>
                        <td>7:30AM</td>
                        <td class="editTask"><a href="default.htm" title="Edit task"><img src="img/edit.gif" alt="Edit" /></a></td>
                        <td class="deleteTask"><a href="default.htm" title="Delete task"><img src="img/delete.gif" alt="Delete" /></a></td>
                      </tr>
                      <tr>
                        <td><a href="default.htm" title="">Preparing the prints</a></td>
                        <td>Sending the PSD and PDF files to the printer</td>
                        <td>18.1.2010</td>
                        <td>11AM</td>
                        <td class="editTask"><a href="default.htm" title="Edit task"><img src="img/edit.gif" alt="Edit" /></a></td>
                        <td class="deleteTask"><a href="default.htm" title="Delete task"><img src="img/delete.gif" alt="Delete" /></a></td>
                      </tr>
                      <tr>
                        <td><a href="default.htm" title="">Excercising</a></td>
                        <td>Sweating at my favourite gym</td>
                        <td>18.1.2010</td>
                        <td>4PM</td>
                        <td class="editTask"><a href="default.htm" title="Edit task"><img src="img/edit.gif" alt="Edit" /></a></td>
                        <td class="deleteTask"><a href="default.htm" title="Delete task"><img src="img/delete.gif" alt="Delete" /></a></td>
                      </tr>
                      <tr>
                        <td><a href="default.htm" title="">Evening out</a></td>
                        <td>Going out with friends</td>
                        <td>18.1.2010</td>
                        <td>7:45PM</td>
                        <td class="editTask"><a href="default.htm" title="Edit task"><img src="img/edit.gif" alt="Edit" /></a></td>
                        <td class="deleteTask"><a href="default.htm" title="Delete task"><img src="img/delete.gif" alt="Delete" /></a></td>
                      </tr>
                    </table>

                    <div class="left-column-1">
                      <h3>Lightweight but powerful</h3>
                      <p>Projectic is a simple and flexible administration user interface that is easy-to-update and also looks nice. It is liquid and has tons of features. </p>
                    </div>
                    
                    <div class="right-column-1">
                      <h3>Features</h3>
                      <p>Projectic has to offer:</p>
                      
                      <ul class="tickedList">
                        <li>Three sets of tabs, tons of menus to make the administration super-organized</li>
                        <li>Small jQuery Calendar</li>
                        <li>Liquid (fluid) layout, the content resizes from 980px, fitting nicely on large screens</li>
                        <li>Valid XHTML and CSS , crossbrowser compatible</li>
                        <li>Closeable notification messages</li>
                        <li>Modal window with fancybox</li>
                        <li>Fluid accordion sidemenu links</li>
                        <li>Nice forms and tables</li>
                        <li>Commented code, extended how-to documentation</li>
                      </ul>
                    </div>
                    <div class="clear"></div>

                  </div> <!--insideTab-1-->
                  
                  
                  <!-- ****************** SUB TAB CONTENT 2 ****************** -->
                  <div id="insideTab-2">
                     <h3>Custom icons used in this theme</h3>
                     <div id="big-icons">
                      <a href="default.htm"><img src="img/icon-search-big.gif" alt="Icon Search" /><br />Search</a>
                      <a href="default.htm"><img src="img/icon-tick-big.gif" alt="Icon Tick" /><br />Tick</a>
                      <a href="default.htm"><img src="img/icon-edit-big.gif" alt="Icon Edit" /><br />Edit</a>
                      <a href="default.htm"><img src="img/icon-delete-big.gif" alt="Icon Delete" /><br />Delete</a>
                    </div>
                  </div> <!--insideTab-2-->
                  
                  
                  <!-- ****************** SUB TAB CONTENT 3 ****************** -->
                  <div id="insideTab-3">
                      <h3>Custom popup message</h3>
                      <p>Use a <strong>text link</strong> - <br /><a href="popup.htm" class="zoom">Click me!</a></p>
                      <p>Or use an <strong>image</strong> - <br /><a href="popup.htm" class="zoom"><img src="img/open-popup.jpg" alt="Click me!" /></a></p>
                      
                  </div> <!--insideTab-2-->
                  
                  
                </div> <!--insideTabs-->

              </div> <!--mainTab-1-->
              
              <!-- ****************** MAIN TAB CONTENT 2 ****************** -->
              <div id="mainTab-2">
                   <h3>Need columns? They are already waiting for you!</h3>
                    <div class="content-50-left-wrapper">
                      <h2 class="content-box-header"><span>Left Content</span></h2>
                      <div class="content-wrapper">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                      </div>
                    </div>
  
                    <div class="content-50-right-wrapper">
                      <h2 class="content-box-header"><span>Right Content</span></h2>
                      <div class="content-wrapper">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                      </div>
                    </div>
  
                    <div class="clear space-2x"></div>
  
                    <div class="content-100-wrapper">
                      <h2 class="content-box-header"><span>Lorem ipsum dolor</span></h2>
                      <div class="content-wrapper">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                        <p>Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                      </div>
                    </div>
  
                    <div class="clear space-2x"></div>
  
                    <div class="content-30-left-wrapper">
                      <h2 class="content-box-header"><span>Left Content</span></h2>
                      <div class="content-wrapper">
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                      </div>
                    </div>
  
                    <div class="content-30-middle-wrapper">
                      <h2 class="content-box-header"><span>Middle Content</span></h2>
                      <div class="content-wrapper">
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                      </div>
                    </div>
  
                    <div class="content-30-right-wrapper">
                      <h2 class="content-box-header"><span>Right Content</span></h2>
                      <div class="content-wrapper">
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                      </div>
                    </div>
                    <div class="clear space-2x"></div>

              </div> <!--mainTab-2-->
              
              <!-- ****************** MAIN TAB CONTENT 3 ****************** -->
              <div id="mainTab-3">     
                    <h3>How to notify a user? Use our various messages!</h3>

                    <div class="message-wrapper ok">
                      <p><strong>OK MESSAGE.</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.  Attention notification.</p>
                      <a href="#" class="close full"><img src="img/close.gif" title="Close the message" alt="close" /></a>
                      <div class="clear"></div>
                    </div>
  
                    <div class="message-wrapper attention">
                      <p><strong>ATTENTION REQUIRED.</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.  Attention notification.</p>
                      <a href="#" class="close full"><img src="img/close.gif" title="Close the message" alt="close" /></a>
                      <div class="clear"></div>
                    </div>

                    <div class="message-wrapper warning">
                      <p><strong>WARNING MESSAGE.</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.  Attention notification.</p>
                      <a href="#" class="close full"><img src="img/close.gif" title="Close the message" alt="close" /></a>
                      <div class="clear"></div>
                    </div>

                    <div class="message-wrapper error">
                      <p><strong>ERROR MESSAGE.</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.  Attention notification.</p>
                      <a href="#" class="close full"><img src="img/close.gif" title="Close the message" alt="close" /></a>
                      <div class="clear"></div>
                    </div>

                    <div class="clear"></div>
                   
              	   	<a href="popup.htm" class="zoom"><img src="img/open-popup.jpg" alt="My modal window" /></a>
                    <div class="clear"></div>
              </div> <!--mainTab-3-->
              
              
              <!-- ****************** MAIN TAB CONTENT 4 ****************** -->
              <div id="mainTab-4">
                  <h3>Sample Form</h3>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.</p>
                    <div class="space-2x"></div>

                    <div class="message-wrapper error" id="sample-form-message">
                      <p><strong>ERROR MESSAGE.</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero.  Attention notification.</p>
                      <ul class="list-errors clear">
                        <li>Error message no.1</li>
                        <li>Error message no.2</li>
                      </ul>
                      <a href="#" class="close"><img src="img/close.gif" title="Close the message" alt="close" /></a>
                      <div class="clear"></div>
                    </div>

                    <div class="space-2x"></div>

                    <form method="post" action="" id="sample-form">
                      <div class="bg-lightgray border-darkgray form-wrapper" id="sample-form-wrapper">
                        <div class="space-2x"></div>

                        <p class="w-30p ta-left"><label class="blue" for="sample_name">Your name :</label></p>
                        <p class="w-70p ta-left"><input type="text" name="sample_name" id="sample_name" class="text-box" value="John Ballard" /></p>
                        <div class="clear pt-2x"></div>
            
                        <p class="w-30p ta-left"><label class="blue" for="passw">Password :</label></p>
                        <p class="w-70p ta-left"><input type="password" name="passw" id="passw" class="text-box" value="password" /></p>
                        <div class="clear pt-2x"></div>

                        <p class="w-30p ta-left"><label class="blue">Horizontal controls :</label></p>
                        <p class="w-70p ta-left">
                          <input type="radio" name="sample_radio_1" class="radio" checked="checked" /><span class="radio-label">all articles</span>
                          <input type="radio" name="sample_radio_1" class="radio" /><span class="radio-label">all posts</span>
                          <input type="radio" name="sample_radio_1" class="radio" /><span class="radio-label">all updates</span>
                        </p>
                        <div class="clear pt-2x"></div>

                        <p class="w-30p ta-left"><label class="blue" for="sample_affiliation">Affiliation :</label></p>
                        <p class="w-70p ta-left">
                          <select name="sample_affiliation" id="sample_affiliation">
                            <option value="choose">choose option ...</option>
                            <option value="option-1">option 1</option>
                            <option value="option-2">option 2</option>
                          </select>
                        </p>
                        <div class="clear pt-2x"></div>

                        <p class="w-30p ta-left"><label class="blue">Vertical controls :</label></p>
                        <p class="w-25p ta-left"><input type="checkbox" name="sample_checkbox_1" class="checkbox" checked="checked" value="all-articles" /><span class="checkbox-label">all articles</span></p>
                        <p class="w-25p ta-left"><input type="radio" name="sample_radio_2" class="radio" checked="checked" /><span class="radio-label">all articles</span></p>
                        <div class="clear"></div>
                        <p class="w-30p ta-left">&nbsp;</p>
                        <p class="w-25p ta-left"><input type="checkbox" name="sample_checkbox_2" class="checkbox" value="all-posts" /><span class="checkbox-label">all posts</span></p>
                        <p class="w-25p ta-left"><input type="radio" name="sample_radio_2" class="radio" /><span class="radio-label">all posts</span></p>
                        <div class="clear"></div>
                        <p class="w-30p ta-left">&nbsp;</p>
                        <p class="w-25p ta-left"><input type="checkbox" name="sample_checkbox_3" class="checkbox" value="all-updates" /><span class="checkbox-label">all updates</span></p>
                        <p class="w-25p ta-left"><input type="radio" name="sample_radio_2" class="radio" /><span class="radio-label">all updates</span></p>
                        <div class="clear pt-2x"></div>

                        <p class="w-30p ta-left"><label class="blue" for="sample_message">Message :</label></p>
                        <div class="clear"></div>
                        <p class=""><textarea name="sample_message" id="sample_message" class="wysiwyg" cols="55" rows="6">Insert your message here ...</textarea></p>
                        <div class="clear pt-2x"></div>

                        <input type="image" class="no-border" name="sample_submit" src="img/submit.gif" alt="Submit form" />

                        <div class="clear pt-2x"></div>
                      </div>
                    </form>
                    <div class="clear pt-2x"></div>
              </div> <!--mainTab-4-->
              
              
              <!-- ****************** MAIN TAB CONTENT 5 ****************** -->
              <div id="mainTab-5">
                  <h3>Enjoy our simple table styling</h3>
                    <table class="data-table">
                      <caption>Website samples</caption>

                      <thead>
                        <tr>
                          <th></th>
                          <th>Thumbnail</th>
                          <th>Name</th>
                          <th>Short description</th>
                          <th>Price</th>
                          <th>Edit/Delete</th>
                        </tr>
                      </thead>

                      <tbody>
                        <tr>
                          <td><input type="checkbox" /></td>
                          <td><img class="table-thumbnail" src="img/table/sample-1.jpg" alt="" /></td>
                          <td><a href="default.htm" title="">Sample website</a></td>
                          <td>Short description comes here</td>
                          <td>$155</td>
                          <td><a class="table-edit" href="#"></a><a class="table-delete" href="#"></a></td>
                        </tr>
    
                        <tr>
                          <td><input type="checkbox" /></td>
                          <td><img class="table-thumbnail" src="img/table/sample-2.jpg" alt="" /></td>
                          <td><a href="default.htm" title="">Sample website</a></td>
                          <td>Short description comes here</td>
                          <td>$171</td>
                          <td><a class="table-edit" href="#"></a><a class="table-delete" href="#"></a></td>
                        </tr>

                        <tr>
                          <td><input type="checkbox" /></td>
                          <td><img class="table-thumbnail" src="img/table/sample-3.jpg" alt="" /></td>
                          <td><a href="default.htm" title="">Sample website</a></td>
                          <td>Short description comes here</td>
                          <td>$122</td>
                          <td><a class="table-edit" href="#"></a><a class="table-delete" href="#"></a></td>
                        </tr>

                        <tr>
                          <td><input type="checkbox" /></td>
                          <td><img class="table-thumbnail" src="img/table/sample-4.jpg" alt="" /></td>
                          <td><a href="default.htm" title="">Sample website</a></td>
                          <td>Short description comes here</td>
                          <td>$155</td>
                          <td><a class="table-edit" href="#"></a><a class="table-delete" href="#"></a></td>
                        </tr>

                        <tr>
                          <td><input type="checkbox" /></td>
                          <td><img class="table-thumbnail" src="img/table/sample-5.jpg" alt="" /></td>
                          <td><a href="default.htm" title="">Sample website</a></td>
                          <td>Short description comes here</td>
                          <td>$210</td>
                          <td><a class="table-edit" href="#"></a><a class="table-delete" href="#"></a></td>
                        </tr>
                        
                      </tbody>
                    </table>

                    <div id="table-left-1">
                      <select name="table_action" id="table-action">
                        <option value="option-1">choose an action</option>
                        <option value="option-2">send record</option>
                        <option value="option-3">remove record</option>
                      </select>
                      <a class="table-button" href="default.htm">Apply to selected</a>
                      <a class="table-button" href="default.htm">Apply to all</a>
                    </div>
                      
                    <div id="table-right-1">
                      <a class="table-button" href="default.htm">Previous</a>
                      <a class="page-number" href="default.htm">1</a>
                      <a class="page-number" href="default.htm">2</a>
                      <a class="page-number page-selected" href="default.htm">3</a>
                      <a class="page-number" href="default.htm">4</a>
                      <a class="page-number" href="default.htm">5</a>
                      <a class="table-button" href="default.htm">Next</a>
                    </div>
                    <div class="clear space-2x"></div> 
              </div> <!--mainTab-5-->

            </div> <!--mainTabs-->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
  
</asp:Content>
