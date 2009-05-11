﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Writer.aspx.cs" Inherits="ExtDirect.Example.Writer.Writer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">    
    <title>Editor Grid/Writer Example</title>
    <style type="text/css">
      #loading-mask{
        position:absolute;
        left:0;
        top:0;
        width:100%;
        height:100%;
        z-index:20000;
        background-color:white;
    }
    #loading{
        position:absolute;
        left:45%;
        top:40%;
        padding:2px;
        z-index:20001;
        height:auto;
    }
    #loading a {
        color:#225588;
    }
    #loading .loading-indicator{
        background:white;
        color:#444;
        font:bold 13px tahoma,arial,helvetica;
        padding:10px;
        margin:0;
        height:auto;
    }
    #loading-msg {
        font: normal 10px arial,tahoma,sans-serif;
    }
    </style> 

    <link rel="stylesheet" type="text/css" href="../../ext-3.0/resources/css/ext-all.css" />
 	<script type="text/javascript" src="../../ext-3.0/adapter/ext/ext-base.js"></script> 	
    <script type="text/javascript" src="../../ext-3.0/ext-all.js"></script>
    <script type="text/javascript" src="../../Proxy.ashx"></script>
    <script type="text/javascript" src="writer.js"></script>
	<script type="text/javascript" src="UserForm.js"></script>
	<script type="text/javascript" src="UserGrid.js"></script>

	<!-- Common Styles for the examples -->
	<link rel="stylesheet" type="text/css" href="../../shared/examples.css" />
	<link rel="stylesheet" type="text/css" href="../../shared/icons/silk.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="loading-mask" style=""></div>
    <div id="loading">
        <div class="loading-indicator"><img src="../../shared/extjs/images/extanim32.gif" width="32" height="32" style="margin-right:8px;float:left;vertical-align:top;"/>Ext Writer <br /><span id="loading-msg">Loading ...</span></div>
    </div>
    <script type="text/javascript" src="../../shared/examples.js"></script><!-- EXAMPLES -->
    <h1>Ext.data.DataWriter Example</h1>
    <p>This example shows how to implement a Writer for your Store.</p>
    <p>Note that the js is not minified so it is readable. See <a href="writer.js">writer.js</a>, <a href="UserForm.js">UserForm.js</a> and
    <a href="UserGrid.js">UserGrid.js</a>.</p>
    <p>The HttpProxy plugged into the store in this example uses the new <em>api</em> configuration instead of an <em>url</em>.
Since we can't run server-side code in these examples, the api here points to static json files which represent simulated CRUD responses
from the server.</p>

    <p>Take note of the requests being generated in Firebug as you interact with the Grid and Form.</p>

    <code><pre>
    var store = new Ext.data.DirectStore({	    	    
	    api: {
	        load: TestAction.getData,
	        create: TestAction.createData,
	        save: TestAction.saveData,
	        destroy: TestAction.deleteData
	    },
	    reader: reader,
	    writer: writer, 	// <-- plug a DataWriter into the store just as you would a Reader
    });
    </pre></code>
    
    <p>Download Code <a href="Writer.zip">Writer.zip</a>.</p>
    
    <div class="container" style="width:500px">
	    <div id="user-form"></div>
	    <div id="user-grid"></div>
    </div>

    </div>
    </form>
</body>
</html>
