<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/sproject">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title><xsl:value-of select="//code"/> - <xsl:value-of select="//seminar"/> - <xsl:value-of select="//aname"/> </title> 
        <!--<link rel="stylesheet" type="text/css" href="https://webdev.fit.cvut.cz/~rybolzde/bi-omo/sprojekt/sprojekt_html.css"/>-->
        <link rel="stylesheet" type="text/css" href="sprojekt_html.css"/>
      </head>

      <body>

<!-- Java script pro vypnuti/zapnuti zobrazeni komentaru -->
<script type="text/javascript" >
var display=1;
function noComment(){
var comments=document.getElementsByName("comment");
if(display==1){
	set_to='block';
	display=0;
}
else{
	set_to='none';
	display=1;
};
for (i in comments){
	el=comments[i].style; 
	el.display=set_to;
}
return false;
}
</script>

<input type="button" value=" Vypnout / zapnout zobrazeni komentaru" onClick="return noComment();"/>

<!-- Informace o kurzu -->
        <h3 class="course">
          <xsl:value-of select="//code"/> -            <xsl:value-of select="//cname"/>,            <xsl:value-of select="//semester"/>
        </h3>

<!-- Informace o autorovi -->
        <h3 class="author">
          <xsl:value-of select="//author1/aname"/> ( <xsl:value-of select="//author1/uname"/> ), <xsl:value-of select="//author2/aname"/> ( <xsl:value-of select="//author2/uname"/> )          <xsl:value-of select="//seminar"/>
        </h3>
        <h4 class="author">
         <xsl:element name="a">
		<xsl:attribute name ="href">
			mailto:<xsl:value-of select="//author1/email"/>
               </xsl:attribute>
              <xsl:value-of select="//author1/email"/>
	   </xsl:element>,
     <xsl:element name="a">
		<xsl:attribute name ="href">
			mailto:<xsl:value-of select="//author2/email"/>
               </xsl:attribute>
              <xsl:value-of select="//author2/email"/>
	   </xsl:element>
        </h4>

<!-- Prohlaseni -->
        <p class="declaration">
          <xsl:value-of select="//declaration"/>
        </p>

<!-- Nazev semestralky -->
        <h1>
          <xsl:value-of select="//content/title"/>
        </h1>

<!-- Popis problemu -->
    <h2>Zadání projektu</h2>
    <h3>Prvotní popis problému</h3>
    <xsl:for-each select="//problem_statement/*">
      <xsl:if test="local-name()='para'"> 
        <p><xsl:apply-templates mode="moje_para"/></p>
      </xsl:if>
      <xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>

<!-- Popis problemove domeny -->
    <h3>Popis problémové domény</h3>
    <xsl:for-each select="//problem_domain/*">
      <xsl:if test="local-name()='para'"> 
        <p><xsl:apply-templates mode="moje_para"/></p>
      </xsl:if>
      <xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>                    
    
<!-- Ucel -->
    <h3>Účel</h3>
    <xsl:for-each select="//purpose/*">
      <xsl:if test="local-name()='para'"> 
        <p><xsl:apply-templates mode="moje_para"/></p>
      </xsl:if>
		  <xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>
    
<!-- Klicove funkce -->
    <h3>Klíčové funkce systému</h3>
    <ol>
    <xsl:for-each select="//functions/*">
      <xsl:if test="local-name()='function'">
				<li><xsl:value-of select="."/></li>
			</xsl:if>
			<xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>
    </ol>

<!-- Pravidla -->
    <h3>Pravidla a omezení systému</h3>
    <ol>
    <xsl:for-each select="//rules/*">
      <xsl:if test="local-name()='rule'">
				<li><xsl:value-of select="."/></li>
			</xsl:if>
			<xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>
    </ol>
    
<!-- Dotazy -->
    <h3>Dotazy</h3>
    <ol>
    <xsl:for-each select="//queries/*">
      <xsl:if test="local-name()='query'">
				<li><xsl:value-of select="."/></li>
			</xsl:if>
			<xsl:if test="local-name()='comment'">
        <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
      </xsl:if> 
    </xsl:for-each>
    </ol>

<!-- Popis -->
    <xsl:if test="//description">
      <h3>Rozbor zadání</h3>
      <xsl:for-each select="//description/*">
   		 <xsl:if test="local-name()='para'"> 
  			<p> <xsl:apply-templates mode="moje_para"/> </p>
  		 </xsl:if>
  		 <xsl:if test="local-name()='comment'">
  			<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
  		 </xsl:if> 
      </xsl:for-each>
    </xsl:if>

<!-- Konceptuální model trid -->
    <h2>Strukturální konceptuální model OntoUML</h2>
      <xsl:element name="img">
        <xsl:attribute name ="src">
          <xsl:value-of select="//conceptual_model/cm_picture//imagedata/@fileref"/>
        </xsl:attribute>
		    <xsl:attribute name ="alt">
          Zde má být obrázek datového modelu.
        </xsl:attribute>
      </xsl:element>

    	<xsl:for-each select="//conceptual_model/comment">
    		<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>	
    	</xsl:for-each>
	
      <h3>Diskuze ke konceptuálnímu modelu OntoUML</h3>
      <xsl:for-each select="//conceptual_model/cm_discussion/*">
     	  <xsl:if test="local-name()='para'"> 
    			<p> <xsl:apply-templates mode="moje_para"/> </p>
    		</xsl:if>
    		<xsl:if test="local-name()='comment'">
    			<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
    		</xsl:if> 
      </xsl:for-each>
      
      <h3>Využití konceptů OntoUML</h3>
   	    <table>
          <tbody>
          	<tr>
          		<th> Koncept </th>
          		<th> Třída </th>
          		<th> Relace </th>
          		<th> Komentář </th>
          	</tr>
          	<xsl:for-each select="//conceptual_model/cm_concepts/cm_concept">
          		<tr>
            		<xsl:element name="td">
            		  <xsl:attribute name="rowspan">
            		    <xsl:value-of select="count(./usages/usage)+1"/>
            		  </xsl:attribute>
            		  <xsl:value-of select="./name"/>
            		</xsl:element>
            	</tr>
            	<xsl:for-each select="./usages/usage">
            		<tr>
            		  <td><xsl:value-of select="./class"/></td>
            		  <td><xsl:value-of select="./relation"/></td>
            		  <td><xsl:value-of select="./comment"/></td>
                </tr>
            	</xsl:for-each>
          	</xsl:for-each>
          </tbody>
        </table>
        
        <xsl:for-each select="//conceptual_model/cm_concepts/comment">
      		<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>	
      	</xsl:for-each>
        
<!-- Implementacni model trid -->
    <h2>Strukturální implementační model UML</h2>
      <xsl:element name="img">
        <xsl:attribute name ="src">
          <xsl:value-of select="//implementation_model/im_picture//imagedata/@fileref"/>
        </xsl:attribute>
		    <xsl:attribute name ="alt">
          Zde má být obrázek datového modelu.
        </xsl:attribute>
      </xsl:element>

    	<xsl:for-each select="//implementation_model/comment">
    		<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>	
    	</xsl:for-each>
	
      <h3>Diskuze k implementačnímu modelu UML</h3>
      <xsl:for-each select="//implementation_model/im_discussion/*">
     	  <xsl:if test="local-name()='para'"> 
    			<p> <xsl:apply-templates mode="moje_para"/> </p>
    		</xsl:if>
    		<xsl:if test="local-name()='comment'">
    			<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
    		</xsl:if> 
      </xsl:for-each>      
          
<!-- Zdrojove soubory a kod -->
<!-- package -->
      <h2>Implementace</h2>
      <p>
        Zdrojový soubor se Smalltalk package: 
        <xsl:element name="a">
          <xsl:attribute name ="href">
            <xsl:value-of select="//implementation/package/file/@fileref"/>
          </xsl:attribute>
  		    <xsl:attribute name ="title">
            Zdrojový soubor se Smalltalk package
          </xsl:attribute>
          <xsl:value-of select="//implementation/package/file/@fileref"/>
        </xsl:element>
      </p>
      
      <h3>Diskuze k implementaci</h3>
      <xsl:for-each select="//implementation/impl_discussion/*">
        <xsl:if test="local-name()='para'"> 
          <p> <xsl:apply-templates mode="moje_para"/> </p>
        </xsl:if>
        <xsl:if test="local-name()='comment'">
          <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
        </xsl:if> 
      </xsl:for-each>  
	    
	    <h3>Využití konceptů objektového programování</h3>
   	    <table>
          <tbody>
          	<tr>
          		<th> Koncept </th>
          		<th> Třída </th>
          		<th> Metoda </th>
          		<th> Komentář </th>
          	</tr>
          	<xsl:for-each select="//implementation/impl_concepts/impl_concept">
          		<tr>
            		<xsl:element name="td">
            		  <xsl:attribute name="rowspan">
            		    <xsl:value-of select="count(./usages/usage)+1"/>
            		  </xsl:attribute>
            		  <xsl:value-of select="./name"/>
            		</xsl:element>
            	</tr>
            	<xsl:for-each select="./usages/usage">
            		<tr>
            		  <td><xsl:value-of select="./class"/></td>
            		  <td><xsl:value-of select="./method"/></td>
            		  <td><xsl:value-of select="./comment"/></td>
                </tr>
            	</xsl:for-each>
          	</xsl:for-each>
          </tbody>
        </table>
        
        <xsl:for-each select="//implementation/impl_concepts/comment">
      		<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>	
      	</xsl:for-each>
        
	<h2>Verifikace splnění zadání</h2>
	<p>
    Zdrojový soubor se Smalltalk package obsahujícím testy: 
    <xsl:element name="a">
      <xsl:attribute name ="href">
        <xsl:value-of select="//verification/package/file/@fileref"/>
      </xsl:attribute>
	    <xsl:attribute name ="title">
        Zdrojový soubor se Smalltalk package obsahujícím testy
      </xsl:attribute>
      <xsl:value-of select="//verification/package/file/@fileref"/>
    </xsl:element>
  </p>
	
	<h3>Automatické testy</h3>
	<table>
  	<tbody>
  	<tr>
  		<th> Test </th>
        <th> Pokrývá dotaz / <br/> pravidlo </th>
  		<th> Popis </th>
  	</tr>
  		<xsl:for-each select="//verification/unit_tests/unit_test">
  			<tr>
          <td><xsl:value-of select="./name"/></td>
          <td><xsl:value-of select="./target"/></td>
          <td><xsl:value-of select="./description"/></td>
  			</tr>
  		</xsl:for-each>
  	</tbody>
	</table>
	
	<xsl:for-each select="//verification/unit_tests/comment">
		<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>	
	</xsl:for-each>

<!-- Zaver -->
        <h2>
          <xsl:value-of select="//conclusions/title"/>
        </h2>
        <xsl:for-each select="//conclusions/*">
 		 <xsl:if test="local-name()='para'"> 
			<p> <xsl:apply-templates mode="moje_para"/> </p>
		 </xsl:if>
		<xsl:if test="local-name()='comment'">
			<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
		</xsl:if> 
        </xsl:for-each>

<!-- Odkazy -->
        <h2>
          <xsl:value-of select="//references/title"/>
        </h2>
        <xsl:for-each select="//references/*">
 		 <xsl:if test="local-name()='para'"> 
			<p> <xsl:apply-templates mode="moje_para"/> </p>
		 </xsl:if>
		<xsl:if test="local-name()='comment'">
			<p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/> </p>
		</xsl:if> 
        </xsl:for-each>

       </body>
    </html>
</xsl:template>

<!-- Nasledujici 2 templates resi mixec content v elementu para  a comment-->
<xsl:template match="*" mode="moje_para">
  <xsl:copy>
   <xsl:copy-of select="@*"/>
   <xsl:apply-templates mode="moje_para"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="link" mode="moje_para">
  <a href="{@url}">
   <xsl:apply-templates mode="moje_para"/>
  </a>
</xsl:template>

<xsl:template match="para" mode="para">
  <p> <xsl:apply-templates mode="moje_para"/></p>
</xsl:template>

<xsl:template match="comment" mode="comment">
  <p class="comment" name="comment"> <xsl:apply-templates mode="moje_para"/></p>
</xsl:template>

</xsl:stylesheet>
