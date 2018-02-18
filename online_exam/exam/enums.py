from enumerify.enum import Enum

class ResponseMsg(Enum):
    INSERT_SUCCESS = "Successfully Inserted!"
    UPDATE_SUCCESS = "Successfully Updated!"
    TRANSC_FAILED = "Please contact with the authorities!"
    HTTP_ERROR_MSG = "Something went wrong while processing your request. Please contact with the authorities!"
    BOOL_TRUE = "true"

    #Subject Section
    SUBJECT_USED = "This subject has already been used!"

class ResponseStatusInt(Enum):
    SUCCESS = 1
    FAILURE = 0

