import{T as m,o as c,c as p,a as t,u as l,b as e,f as u,i as n,v as r,n as g,F as b,Z as _}from"./app-CSFOjpJl.js";import y from"./Header-DkPCRY2z.js";import{_ as i}from"./InputError-CfVs4M-W.js";import"./Navbar-DbcvQ2yD.js";import"./Logo-D7j7sF7c.js";import"./_plugin-vue_export-helper-DlAUqK2U.js";const h="/build/assets/contact-women-talking-svgrepo-com-ldDerPHL.svg",f={class:"bg-gray-100"},x={class:"mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8"},v={class:"grid grid-cols-1 gap-x-16 gap-y-8 lg:grid-cols-5"},w={class:"lg:col-span-2 lg:py-12 mx-auto hidden lg:flex"},V=["src"],j={class:"rounded-lg bg-white p-8 shadow-lg lg:col-span-3 lg:p-12"},B=e("label",{class:"sr-only",for:"name"},"Name",-1),N=e("label",{class:"sr-only",for:"name"},"Subject",-1),U={class:"grid grid-cols-1 gap-4 sm:grid-cols-2"},k=e("label",{class:"sr-only",for:"email"},"Email",-1),E=e("label",{class:"sr-only",for:"phone"},"Phone",-1),M=e("label",{class:"sr-only",for:"message"},"Message",-1),S={class:"mt-4"},F=["disabled"],H={__name:"Contact",props:{canLogin:{type:Boolean},canRegister:{type:Boolean}},setup(P){const s=m({name:"",subject:"",email:"",phone:"",message:""}),d=()=>{s.post(route("contact.email"),{onFinish:()=>s.reset()})};return(C,o)=>(c(),p(b,null,[t(l(_),{title:"Vision"}),t(y),e("section",f,[e("div",x,[e("div",v,[e("div",w,[e("img",{src:l(h),alt:""},null,8,V)]),e("div",j,[e("form",{class:"space-y-4",onSubmit:u(d,["prevent"])},[e("div",null,[B,n(e("input",{class:"w-full rounded-lg border-gray-200 p-3 text-sm",placeholder:"Name",type:"text",id:"name","onUpdate:modelValue":o[0]||(o[0]=a=>l(s).name=a)},null,512),[[r,l(s).name]]),t(i,{class:"mt-3",message:l(s).errors.name},null,8,["message"])]),e("div",null,[N,n(e("input",{class:"w-full rounded-lg border-gray-200 p-3 text-sm",placeholder:"Subject",type:"text",id:"subject","onUpdate:modelValue":o[1]||(o[1]=a=>l(s).subject=a)},null,512),[[r,l(s).subject]]),t(i,{class:"mt-3",message:l(s).errors.subject},null,8,["message"])]),e("div",U,[e("div",null,[k,n(e("input",{class:"w-full rounded-lg border-gray-200 p-3 text-sm",placeholder:"Email address",type:"email",id:"email","onUpdate:modelValue":o[2]||(o[2]=a=>l(s).email=a)},null,512),[[r,l(s).email]]),t(i,{class:"mt-3",message:l(s).errors.email},null,8,["message"])]),e("div",null,[E,n(e("input",{class:"w-full rounded-lg border-gray-200 p-3 text-sm",placeholder:"Phone Number",type:"tel",id:"phone","onUpdate:modelValue":o[3]||(o[3]=a=>l(s).phone=a)},null,512),[[r,l(s).phone]]),t(i,{class:"mt-3",message:l(s).errors.phone},null,8,["message"])])]),e("div",null,[M,n(e("textarea",{class:"w-full rounded-lg border-gray-200 p-3 text-sm",placeholder:"Message",rows:"8",id:"message","onUpdate:modelValue":o[4]||(o[4]=a=>l(s).message=a)},null,512),[[r,l(s).message]]),t(i,{class:"mt-3",message:l(s).errors.message},null,8,["message"])]),e("div",S,[e("button",{type:"submit",class:g(["inline-block w-full rounded-lg bg-primary-800 hover:bg-primary-600 px-5 py-3 font-medium text-white sm:w-auto",{"opacity-25":l(s).processing}]),disabled:l(s).processing}," Send Enquiry ",10,F)])],32)])])])])],64))}};export{H as default};
