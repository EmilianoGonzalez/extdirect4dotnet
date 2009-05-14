
Ext.Direct.addProvider(Ext.app.REMOTING_API); 

var Employee = Ext.data.Record.create([
    {name: 'firstname'},                  // map the Record's "firstname" field to the row object's key of the same name
    {name: 'job', mapping: 'occupation'}  // map the Record's "job" field to the row object's "occupation" key
]);

var reader = new Ext.data.JsonReader({
    totalProperty: 'total',
    successProperty: 'success',
    idProperty: 'id',
    root: 'data'
    },[
	    { name: 'id' },
	    { name: 'email', allowBlank: false },
	    { name: 'first', allowBlank: false },
	    { name: 'last', allowBlank: false }
    ]
);
	var writer = new Ext.data.JsonWriter({
	    returnJson: false,
	    writeAllFields: true
	});

	var store = new Ext.data.DirectStore({	    	    
	    api: {
	        load: CRUDSampleMethods.read,
	        create: CRUDSampleMethods.create,
	        save: CRUDSampleMethods.update,
	        destroy: CRUDSampleMethods.destroy
	    },
	    reader: reader,
	    baseParams: {dummy:'blubb'},
	    writer: writer, 	// <-- plug a DataWriter into the store just as you would a Reader
	    paramsAsHash: true,
	    batchSave: false,
	    prettyUrls: false,
	    remoteSort: true,
	    listeners: {
	        load: function(result) {	        
	        },
	        loadexception: function() {

	        },
	        scope: this
	    }
	});
//

var userColumns =  [
    {header: "ID", width: 40, sortable: true, dataIndex: 'id'},
    {header: "Email", width: 100, sortable: true, dataIndex: 'email', editor: new Ext.form.TextField({})},
    {header: "First", width: 50, sortable: true, dataIndex: 'first', editor: new Ext.form.TextField({})},
    {header: "Last", width: 50, sortable: true, dataIndex: 'last', editor: new Ext.form.TextField({})}
];
Ext.onReady(function() {
	Ext.QuickTips.init();

	var userForm = new App.user.Form({
		renderTo: 'user-form',
		listeners: {
			create : function(fpanel, data) {	// <-- custom "create" event defined in App.user.Form class
				var rec = new userGrid.store.recordType(data);
				userGrid.store.insert(0, rec);
			}
		}
	});

	// create user.Grid instance (@see UserGrid.js)
	var userGrid = new App.user.Grid({
		renderTo: 'user-grid',
		store: store,
		columns : userColumns,
		listeners: {
			rowclick: function(g, index, ev) {
				var rec = g.store.getAt(index);
				userForm.loadRecord(rec);
			},
			destroy : function() {
				userForm.getForm().reset();
			}
		}
});
setTimeout(function() {
    Ext.get('loading').remove();
    Ext.fly('loading-mask').fadeOut({
        remove: true
    });
    //store.load();

}, 250);
});