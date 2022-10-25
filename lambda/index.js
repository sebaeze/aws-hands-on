exports.handler = async(event) => {
    console.log(event);
    console.log(`**** i'm a lamdba console.log. This is the argument key1: ${event.key1||"**nothing**"}`);
    if ( Object.keys(event).length>0 ){
        return {msg:"Arguments of the requests are listed in the return --> ",...event} ;
    } else {
        return {msg:" ***there is no arguments in this request ***"} ;
    } ;
}