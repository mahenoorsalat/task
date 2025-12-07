import { Database } from "@/lib/database.types"


export type Task = Database["public"]["Tables"]["tasks"]["Row"]
export type Profile = Database["public"]["Tables"]["profiles"]["Row"]

export type User = Profile & {
    email : string , 
    tasks_created : number ;
};


