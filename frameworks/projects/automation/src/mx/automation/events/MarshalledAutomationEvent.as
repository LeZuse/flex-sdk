package mx.automation.events
{
	import mx.automation.IAutomationObject;
	//import mx.events.SWFBridgeEvent;
	import flash.events.Event;
	 
	/**
	 *  The MarshalledAutomationEvents class represents event objects that are dispatched 
	 *  by the AutomationManager.This represents the marshalling related events.
	 */
	public class MarshalledAutomationEvent extends Event
	{
 	   include "../../core/Version.as";
		

    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------
   
    public static const BEGIN_RECORDING:String = "BeginRecording";
    public static const END_RECORDING:String = "EndRecording";
         
    public static const UNIQUE_APPID_REQUEST:String = "GetUniqueAppID";
    public static const UNIQUE_APPID_REPLY:String = "GetUniqueAppIDReply";
    
    public static const POPUP_HANDLER_REQUEST:String = "HandlePopUp";
    public static const DRAG_DROP_PROXY_RETRIEVE_REQUEST:String = "GiveProxy";
    public static const DRAG_DROP_PROXY_RETRIEVE_REPLY:String = "GiveProxyReply";
   
   	public static const UPDATE_SYCHRONIZATION:String = "UpdateSynchronization";
   	public static const INITIAL_DETAILS_REQUEST:String = "InitialDetailsRequest";
   	public static const INITIAL_DETAILS_REPLY:String = "InitialDetailsReply";
   	public static const DRAG_DROP_PERFORM_REQUEST_TO_ROOT_APP:String = "performDragDropRequestToRootApp";
   	public static const DRAG_DROP_PERFORM_REQUEST_TO_SUB_APP:String = "performDragDropRequestToSubApp";
   	   
    public static function marshal(event:Event):MarshalledAutomationEvent
    {
        var eventObj:Object = event;
        return new MarshalledAutomationEvent(eventObj.type,
                                        eventObj.bubbles,
                                        eventObj.cancelable,
                                        eventObj.applicationName,
                                        eventObj.interAppDataToSubApp ,
                                        eventObj.interAppDataToMainApp);
                                        
     }
    
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

   	public function MarshalledAutomationEvent(type:String, 
   	                                      bubbles:Boolean = true,
                                          cancelable:Boolean = true,
                                          applicationName:String = null , 
                                          interAppDataToSubApp :Array =null,
                                          interAppDataToMainApp:Array = null)
	{	
        super(type, bubbles, cancelable);
        this.applicationName = applicationName;
        this.interAppDataToSubApp = interAppDataToSubApp;
        this.interAppDataToMainApp = interAppDataToMainApp;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

	
	/**
     *  Contains <code>string</code> which represents the application Name  for the application.
     */
	public var applicationName:String;
	
	
	/**
     *  Contains <code>string</code> which represents the descriptionXML details for findObjectIDs.
     */
	public var interAppDataToSubApp:Array;
	
	/**
     *  Contains <code>Object</code> which represents the result details for findObjectIDs.
     */
	public var interAppDataToMainApp:Array;
	
	
	
	
	
    //--------------------------------------------------------------------------
    //
    //  Overridden methods: Event
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    override public function clone():Event
    {
        return new MarshalledAutomationEvent(type, bubbles, cancelable,/*
                                         automationObject,
                                         replayableEvent,
                                         args,
                                         name,
                                         cacheable,*/
                                         applicationName, interAppDataToSubApp,interAppDataToMainApp);
    }
 
    
 }
}