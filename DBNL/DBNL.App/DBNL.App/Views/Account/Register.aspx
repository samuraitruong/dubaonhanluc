<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Account>" %>
<%@ Import Namespace="DBNL.App.Extensions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">

<link href="<%= Url.Content("~/Content/jqueryUI1.8a/css/redmond/jquery-ui-1.8.css") %>" rel="stylesheet" type="text/css" />
<link href="<%= Url.Content("~/Content/reset.css") %>" rel="stylesheet" type="text/css" />
<script src="<%= Url.Content("~/Content/jqueryUI1.8a/js/jquery-ui-1.8.min.js")%>" type="text/javascript"></script>
<link type="text/css" rel="Stylesheet" href="<%=Url.Content("~/Content/table.css") %>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
    <style type="text/css">
        .news_article 
        {
            min-height:950px !important;
        }
        .field-validation-error
        {
            color:Red;
        }
        
    </style>
    
<link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/account.css")%>"/>

 <script type="text/javascript" src="<% =Url.Content("~/Content/jqueryUI1.8a/development-bundle/ui/minified/jquery.ui.datepicker.min.js")%>"></script>
     <script language="javascript" type="text/javascript">
         $(document).ready(function () {

             $('#Birthday').datepicker({ dateFormat: 'dd/mm/yy', yearRange: '2000:2020', showButtonPanel: true, buttonImage: 'http://www.marocotel.com/images/btn_datepicker.gif', buttonImageOnly: true, changeMonth: true, changeYear: true });

         });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Đăng kí tài khoản</h2>
		</div>
		<div class="news_article">
<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>

            <div class="alpha">
      <div class="cage" id="join-flow-main">
        <div class="section-head">
          <div class="main-head">
            
            <h2>Nhập thông tin cá nhân của bạn bên dưới</h2>
            
          </div>
        </div>
        <div class="section last main-info">
          <% using (Html.BeginForm("Register", "Account", FormMethod.Post, new { enctype = "multipart/form-data", @class = "international" , id="form-join" }))
             {%>
                     <%= Html.ValidationSummary(true)%>
  
  <ul>
    
    <li class="field-container"><label class="" for="inp-join-email">
      <span class="field-name">Email <span class="required">*</span></span>
      <%=Html.TextBoxFor(model=>model.Email )%>
      <span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow" style="display: none;">
    Check your inbox. You'll receive a confirmation email.
  </div>
    </li>

    <li class="field-container"><label class="" for="inp-join-email">
      <span class="field-name">Tên tài khoản<span class="required">*</span></span>
      <%=Html.TextBoxFor(model=>model.Login)%>
      <span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow" style="display: none;">
    Check your inbox. You'll receive a confirmation email.
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-password1">
      <span class="field-name">Mật khẩu</span>
      <%=Html.PasswordFor(model => model.Password)%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    At least six characters.
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Xác nhận</span>
      <%=Html.Password("PasswordConfirm")%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Họ tên</span>
      <%=Html.TextBoxFor(model=>model.Name )%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Ngày sinh</span>
      <%=Html.TextBoxFor(model=>model.Birthday )%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>
     <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Giới tính</span>
      <%=Html.RadioButtonFor(p => p.IsMale, "true", new {style="width:15px", groupname="r" })%><span>Nam</span>
      <%=Html.RadioButtonFor(p => p.IsMale, "false", new {style="width:15px", groupname="r" })%><span>Nữ</span>
      
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>

     <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Chuyên Môn</span>
        <%=Html.DropDownListFor(model=>model.CareerId, DBNL.App.Models.Statics.CustomSelectList.CreateCareerList()) %>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>

     <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Địa chỉ</span>
      <%=Html.TextBoxFor(model=>model.Address )%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>

    <li class="field-container"><label class="" for="inp-join-password2">
      <span class="field-name">Điện thoại</span>
      <%=Html.TextBoxFor(model=>model.Phone )%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    Repeat your password. Don't mess up!
  </div>
    </li>

    

    <%--<li id="item-domestic" class="field-container"><label class="" for="inp-join-zipcode">
      <span class="field-name">Công ty</span>
      <input type="text" tabindex="9" value="" id="inp-join-zipcode" name="zipcode"><span class="alert-error"></span></label>  <div class="form-error" id="error-zipcode">
    
      Please enter a valid U.S. zipcode. <span class="fakelink click-international">Not in the U.S.?</span>
    
  </div>
      <div class="tooltip hidden link-arrow">
    
        So we can tell you what's going on nearby.
        <span class="fakelink click-international">Not in the United States?</span>
      
  </div>
    </li>
    <li class="field-container" id="item-international">
      <label for="inp-join-city" class="">
        <span class="field-name">City</span>
        <input type="text" name="city" id="inp-join-city" value="" tabindex="10"> 
        </label><label class="" for="inp-country">
      <select tabindex="11" id="inp-country" name="country"> 
        <option value="">select country</option>
          <option value="+227">United States</option>
        <option value="+14">Australia</option>
        <option value="+39">Canada</option>
        <option value="+74">France</option>
        <option value="+81">Germany</option>
        <option value="+226">United Kingdom</option>
        <option value="0">---------------------</option>
        <option value="1">Afghanistan</option>
        <option value="2">Åland Islands</option>
        <option value="3">Albania</option>
        <option value="4">Algeria</option>
        <option value="5">American Samoa</option>
        <option value="6">Andorra</option>
        <option value="7">Angola</option>
        <option value="8">Anguilla</option>
        <option value="9">Antarctica</option>
        <option value="10">Antigua and Barbuda</option>
        <option value="11">Argentina</option>
        <option value="12">Armenia</option>
        <option value="13">Aruba</option>
        <option value="14">Australia</option>
        <option value="15">Austria</option>
        <option value="16">Azerbaijan</option>
        <option value="17">Bahamas</option>
        <option value="18">Bahrain</option>
        <option value="19">Bangladesh</option>
        <option value="20">Barbados</option>
        <option value="21">Belarus</option>
        <option value="22">Belgium</option>
        <option value="23">Belize</option>
        <option value="24">Benin</option>
        <option value="25">Bermuda</option>
        <option value="26">Bhutan</option>
        <option value="27">Bolivia</option>
        <option value="28">Bosnia and Herzegovina</option>
        <option value="29">Botswana</option>
        <option value="30">Bouvet Island</option>
        <option value="31">Brazil</option>
        <option value="32">British Indian Ocean Territory</option>
        <option value="33">Brunei Darussalam</option>
        <option value="34">Bulgaria</option>
        <option value="35">Burkina Faso</option>
        <option value="36">Burundi</option>
        <option value="37">Cambodia</option>
        <option value="38">Cameroon</option>
        <option value="39">Canada</option>
        <option value="40">Cape Verde</option>
        <option value="54">Côte d'Ivoire</option>
        <option value="41">Cayman Islands</option>
        <option value="42">Central African Republic</option>
        <option value="43">Chad</option>
        <option value="44">Chile</option>
        <option value="45">China</option>
        <option value="46">Christmas Island</option>
        <option value="47">Cocos (Keeling) Islands</option>
        <option value="48">Colombia</option>
        <option value="49">Comoros</option>
        <option value="50">Congo</option>
        <option value="51">Congo, the Democratic Republic of the</option>
        <option value="52">Cook Islands</option>
        <option value="53">Costa Rica</option>
        <option value="55">Croatia</option>
        <option value="56">Cuba</option>
        <option value="57">Cyprus</option>
        <option value="58">Czech Republic</option>
        <option value="59">Denmark</option>
        <option value="60">Djibouti</option>
        <option value="61">Dominica</option>
        <option value="62">Dominican Republic</option>
        <option value="63">Ecuador</option>
        <option value="64">Egypt</option>
        <option value="65">El Salvador</option>
        <option value="66">Equatorial Guinea</option>
        <option value="67">Eritrea</option>
        <option value="68">Estonia</option>
        <option value="69">Ethiopia</option>
        <option value="70">Falkland Islands (Malvinas)</option>
        <option value="71">Faroe Islands</option>
        <option value="72">Fiji</option>
        <option value="73">Finland</option>
        <option value="74">France</option>
        <option value="75">French Guiana</option>
        <option value="76">French Polynesia</option>
        <option value="77">French Southern Territories</option>
        <option value="78">Gabon</option>
        <option value="79">Gambia</option>
        <option value="80">Georgia</option>
        <option value="81">Germany</option>
        <option value="82">Ghana</option>
        <option value="83">Gibraltar</option>
        <option value="84">Greece</option>
        <option value="85">Greenland</option>
        <option value="86">Grenada</option>
        <option value="87">Guadeloupe</option>
        <option value="88">Guam</option>
        <option value="89">Guatemala</option>
        <option value="243">Guernsey</option>
        <option value="90">Guinea</option>
        <option value="91">Guinea-Bissau</option>
        <option value="92">Guyana</option>
        <option value="93">Haiti</option>
        <option value="94">Heard Island and McDonald Islands</option>
        <option value="95">Holy See (Vatican City State)</option>
        <option value="96">Honduras</option>
        <option value="97">Hong Kong</option>
        <option value="98">Hungary</option>
        <option value="99">Iceland</option>
        <option value="100">India</option>
        <option value="101">Indonesia</option>
        <option value="102">Iran, Islamic Republic of</option>
        <option value="103">Iraq</option>
        <option value="104">Ireland</option>
        <option value="244">Isle of Man</option>
        <option value="105">Israel</option>
        <option value="106">Italy</option>
        <option value="107">Jamaica</option>
        <option value="108">Japan</option>
        <option value="245">Jersey</option>
        <option value="109">Jordan</option>
        <option value="110">Kazakhstan</option>
        <option value="111">Kenya</option>
        <option value="112">Kiribati</option>
        <option value="113">Korea, Democratic People's Republic of</option>
        <option value="114">Korea, Republic of</option>
        <option value="115">Kuwait</option>
        <option value="116">Kyrgyzstan</option>
        <option value="117">Lao People's Democratic Republic</option>
        <option value="118">Latvia</option>
        <option value="119">Lebanon</option>
        <option value="120">Lesotho</option>
        <option value="121">Liberia</option>
        <option value="122">Libyan Arab Jamahiriya</option>
        <option value="123">Liechtenstein</option>
        <option value="124">Lithuania</option>
        <option value="125">Luxembourg</option>
        <option value="126">Macao</option>
        <option value="128">Madagascar</option>
        <option value="129">Malawi</option>
        <option value="130">Malaysia</option>
        <option value="131">Maldives</option>
        <option value="132">Mali</option>
        <option value="133">Malta</option>
        <option value="134">Marshall Islands</option>
        <option value="135">Martinique</option>
        <option value="136">Mauritania</option>
        <option value="137">Mauritius</option>
        <option value="138">Mayotte</option>
        <option value="139">Mexico</option>
        <option value="140">Micronesia, Federated States of</option>
        <option value="141">Moldova, Republic of</option>
        <option value="142">Monaco</option>
        <option value="143">Mongolia</option>
        <option value="144">Montserrat</option>
        <option value="145">Morocco</option>
        <option value="146">Mozambique</option>
        <option value="147">Myanmar</option>
        <option value="148">Namibia</option>
        <option value="149">Nauru</option>
        <option value="150">Nepal</option>
        <option value="151">Netherlands</option>
        <option value="152">Netherlands Antilles</option>
        <option value="153">New Caledonia</option>
        <option value="154">New Zealand</option>
        <option value="155">Nicaragua</option>
        <option value="156">Niger</option>
        <option value="157">Nigeria</option>
        <option value="158">Niue</option>
        <option value="159">Norfolk Island</option>
        <option value="160">Northern Mariana Islands</option>
        <option value="161">Norway</option>
        <option value="162">Oman</option>
        <option value="163">Pakistan</option>
        <option value="164">Palau</option>
        <option value="165">Palestinian Territory, Occupied</option>
        <option value="166">Panama</option>
        <option value="167">Papua New Guinea</option>
        <option value="168">Paraguay</option>
        <option value="169">Peru</option>
        <option value="170">Philippines</option>
        <option value="171">Pitcairn</option>
        <option value="172">Poland</option>
        <option value="173">Portugal</option>
        <option value="174">Puerto Rico</option>
        <option value="175">Qatar</option>
        <option value="127">Republic of Macedonia</option>
        <option value="176">Reunion</option>
        <option value="177">Romania</option>
        <option value="178">Russian Federation</option>
        <option value="179">Rwanda</option>
        <option value="180">Saint Helena</option>
        <option value="181">Saint Kitts and Nevis</option>
        <option value="182">Saint Lucia</option>
        <option value="183">Saint Pierre and Miquelon</option>
        <option value="184">Saint Vincent and the Grenadines</option>
        <option value="185">Samoa</option>
        <option value="186">San Marino</option>
        <option value="187">Sao Tome and Principe</option>
        <option value="188">Saudi Arabia</option>
        <option value="248">Second Life</option>
        <option value="189">Senegal</option>
        <option value="190">Serbia and Montenegro</option>
        <option value="191">Seychelles</option>
        <option value="192">Sierra Leone</option>
        <option value="193">Singapore</option>
        <option value="194">Slovakia</option>
        <option value="195">Slovenia</option>
        <option value="196">Solomon Islands</option>
        <option value="197">Somalia</option>
        <option value="198">South Africa</option>
        <option value="199">South Georgia and the South Sandwich Islands</option>
        <option value="200">Spain</option>
        <option value="201">Sri Lanka</option>
        <option value="202">Sudan</option>
        <option value="203">Suriname</option>
        <option value="204">Svalbard and Jan Mayen</option>
        <option value="205">Swaziland</option>
        <option value="206">Sweden</option>
        <option value="207">Switzerland</option>
        <option value="208">Syrian Arab Republic</option>
        <option value="209">Taiwan</option>
        <option value="210">Tajikistan</option>
        <option value="211">Tanzania, United Republic of</option>
        <option value="212">Thailand</option>
        <option value="213">Timor-Leste</option>
        <option value="214">Togo</option>
        <option value="215">Tokelau</option>
        <option value="216">Tonga</option>
        <option value="217">Trinidad and Tobago</option>
        <option value="218">Tunisia</option>
        <option value="219">Turkey</option>
        <option value="220">Turkmenistan</option>
        <option value="221">Turks and Caicos Islands</option>
        <option value="222">Tuvalu</option>
        <option value="223">Uganda</option>
        <option value="224">Ukraine</option>
        <option value="225">United Arab Emirates</option>
        <option value="226">United Kingdom</option>
        <option value="227">United States</option>
        <option value="228">United States Minor Outlying Islands</option>
        <option value="229">Uruguay</option>
        <option value="230">Uzbekistan</option>
        <option value="231">Vanuatu</option>
        <option value="232">Venezuela</option>
        <option value="233">Viet Nam</option>
        <option value="234">Virgin Islands, British</option>
        <option value="235">Virgin Islands, U.S.</option>
        <option value="236">Wallis and Futuna</option>
        <option value="237">Western Sahara</option>
        <option value="238">Yemen</option>
        <option value="239">Zambia</option>
        <option value="240">Zimbabwe</option>
      </select><span class="alert-error"></span></label>  <div class="form-error" id="error-country">
    
      Please enter a valid city and country. <span class="fakelink click-domestic">In the U.S.?</span>
    
  </div>
      
      <div class="cleaner"></div>
      <div class="tooltip hidden link-arrow">
    
        So we can tell you what's going on nearby.
        <span class="fakelink click-domestic">In the United States?</span>
      
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-gender">
      <span class="field-name">gender</span>
      <select tabindex="12" id="inp-join-gender" name="gender"> 
        <option value="">select gender</option>
          <option value="M">Male</option>
        <option value="F">Female</option>
      </select><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    This helps us improve our recommendations.
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-yob">
      <span class="field-name">year of birth</span>
      <select tabindex="13" id="inp-join-yob" name="yob"> 
        <option value="">pick a year</option>
          <option value="1997">1997</option>
        <option value="1996">1996</option>
        <option value="1995">1995</option>
        <option value="1994">1994</option>
        <option value="1993">1993</option>
        <option value="1992">1992</option>
        <option value="1991">1991</option>
        <option value="1990">1990</option>
        <option value="1989">1989</option>
        <option value="1988">1988</option>
        <option value="1987">1987</option>
        <option value="1986">1986</option>
        <option value="1985">1985</option>
        <option value="1984">1984</option>
        <option value="1983">1983</option>
        <option value="1982">1982</option>
        <option value="1981">1981</option>
        <option value="1980">1980</option>
        <option value="1979">1979</option>
        <option value="1978">1978</option>
        <option value="1977">1977</option>
        <option value="1976">1976</option>
        <option value="1975">1975</option>
        <option value="1974">1974</option>
        <option value="1973">1973</option>
        <option value="1972">1972</option>
        <option value="1971">1971</option>
        <option value="1970">1970</option>
        <option value="1969">1969</option>
        <option value="1968">1968</option>
        <option value="1967">1967</option>
        <option value="1966">1966</option>
        <option value="1965">1965</option>
        <option value="1964">1964</option>
        <option value="1963">1963</option>
        <option value="1962">1962</option>
        <option value="1961">1961</option>
        <option value="1960">1960</option>
        <option value="1959">1959</option>
        <option value="1958">1958</option>
        <option value="1957">1957</option>
        <option value="1956">1956</option>
        <option value="1955">1955</option>
        <option value="1954">1954</option>
        <option value="1953">1953</option>
        <option value="1952">1952</option>
        <option value="1951">1951</option>
        <option value="1950">1950</option>
        <option value="1949">1949</option>
        <option value="1948">1948</option>
        <option value="1947">1947</option>
        <option value="1946">1946</option>
        <option value="1945">1945</option>
        <option value="1944">1944</option>
        <option value="1943">1943</option>
        <option value="1942">1942</option>
        <option value="1941">1941</option>
        <option value="1940">1940</option>
        <option value="1939">1939</option>
        <option value="1938">1938</option>
        <option value="1937">1937</option>
        <option value="1936">1936</option>
        <option value="1935">1935</option>
        <option value="1934">1934</option>
        <option value="1933">1933</option>
        <option value="1932">1932</option>
        <option value="1931">1931</option>
        <option value="1930">1930</option>
        <option value="1929">1929</option>
        <option value="1928">1928</option>
        <option value="1927">1927</option>
        <option value="1926">1926</option>
        <option value="1925">1925</option>
        <option value="1924">1924</option>
        <option value="1923">1923</option>
        <option value="1922">1922</option>
        <option value="1921">1921</option>
        <option value="1920">1920</option>
        <option value="1919">1919</option>
        <option value="1918">1918</option>
        <option value="1917">1917</option>
        <option value="1916">1916</option>
        <option value="1915">1915</option>
        <option value="1914">1914</option>
        <option value="1913">1913</option>
        <option value="1912">1912</option>
        <option value="1911">1911</option>
        <option value="1910">1910</option>
        <option value="1909">1909</option>
        <option value="1908">1908</option>
        <option value="1907">1907</option>
      </select><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    You have to be at least thirteen to use Eventful.
  </div>
    </li>
    <li class="field-container checkbox-container thirteen-container"><label class="" for="inp-thirteen">
  <input type="checkbox" class="checkbox" tabindex="14" value="1" id="inp-thirteen" name="thirteen"> 
  I am 13 years old.<span class="alert-error"></span></label>
  <div class="form-error" id="error-thirteen">
      Đồng  ý 
    
  </div>
    </li>
    <li id="mobile-field-container" class="field-container hidden"> <label class="" for="inp-mobile1">
      <span class="field-name">mobile number <span class="diminished">(optional)</span></span>
      <input type="text" tabindex="15" value="" id="inp-mobile1" name="mobile1"><span class="alert-error"></span></label> <label class="" for="inp-mobile2">
      <input type="text" tabindex="16" value="" id="inp-mobile2" name="mobile2"></label> <label class="" for="inp-mobile3">
      <input type="text" tabindex="17" value="" id="inp-mobile3" name="mobile3"></label> <label class="" for="inp-carrier">
      <select tabindex="18" id="inp-carrier" name="carrier"> 
        <option value="">pick a carrier</option>
          <option value="t-mobile">Orange/T-Mobile</option>
        <option value="vodaphone">Vodafone</option>
        <option value="o2">O2</option>
        <option value="3">3</option>
        <option value="virgin">Virgin Mobile</option>
        <option value="other">Other</option>
      </select><span class="alert-error"></span></label> 
    </li>
    --%>
      <li id="captcha-field-container" class="field-container" style="height:120px">
        <label class="" for="inp-captcha">
      <span class="field-name">Mã xác nhận</span>
    <span id="img-captcha" class="input-captcha" style="background-image: url(&quot;/tools/captcha/image?image=a20gl6wq7&amp;v=2&quot;);">
    
    <%= Html.GenerateCaptcha()%>	</span><span class="alert-error">
        <%=Html.ValidationMessage("Captcha") %> </span></label> 
        
        
        <div class="tooltip hidden link-arrow">
    To make sure that you're not a robot from the future.
  </div>
      </li>
    
    <li class="field-container checkbox-container"><label class="" for="inp-opt_partners">
  <%=Html.CheckBoxFor(model => model.IsNewsletter, new { @class ="checkbox"})%>
  Đồng ý nhận thông tin từ trung tâm qua email.</label>
    </li>
    <li style="height:25px" class="field-container">
        <%= Html.ValidationMessage("FORM_ERR") %>
        <%=Html.ValidationMessage("Captcha") %>
    </li>
    <li class="buttons">
      <button tabindex="21" class="shiny-positive-large-jumbo" type="submit" id="inp-join-submit">Đăng kí</button>
      <p id="form-summary" class="form-summary"></p>
      <p class="progress"></p>
    </li>
  </ul>
  
  
<%} %>

        </div>
       <%--<div id="disclaimer">
          By clicking “Continue”, you agree to Eventful's <a target="_blank" href="/terms">Terms of service</a> and <a target="_blank" href="/privacy">Privacy policy</a> and to receive demand updates and info from Eventful.
        </div>--%>
      </div> <!-- end cage -->
    </div>	
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

