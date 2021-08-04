variable "loc" {
    description = "Default Azure region"
    default     =   "eastus"
}

variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}

variable "webapplocs" {
    description = "list of locations for web apps"
    type = list(string)
    default = []  
}