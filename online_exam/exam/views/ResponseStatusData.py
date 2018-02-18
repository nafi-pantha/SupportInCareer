from django.http import JsonResponse


class ResponseStatusData():

    def responseStatusData(self, status, statusMsg):
        return JsonResponse({'status': status, 'msg': statusMsg})