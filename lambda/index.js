exports.handler = async(event) => {
    console.log(event);
    console.log(`**** i'm a lamdba console.log. This is the argument key1: ${event.key1||"**nothing**"}`);
}