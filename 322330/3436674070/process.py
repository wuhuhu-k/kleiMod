import hashlib
import os
import shutil
from glob import glob

import tqdm

current_dir = os.path.dirname(__file__)



#####################################################
def calculate_md5(file_path):
    # 创建MD5对象
    md5_hash = hashlib.md5()
    try:
        # 以二进制模式打开文件
        with open(file_path, 'rb') as file:
            # 分块读取文件
            for chunk in iter(lambda: file.read(4096), b""):
                # 更新MD5对象
                md5_hash.update(chunk)
        # 获取十六进制表示的MD5哈希值
        return md5_hash.hexdigest()
    except FileNotFoundError:
        print(f"文件 {file_path} 未找到。")
        return None

filelist = glob(r"D:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\data\anim\dynamic\*")
with open(os.path.join(current_dir,'old_dyn.txt'), 'w') as f:
    for item in tqdm.tqdm(filelist):
        name = os.path.split(item)[-1]
        md5 = calculate_md5(item)
        f.write("%s %s\n" % (name, md5))


filelist = glob(r"D:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\data\databundles\anim\dynamic\*")
with open(os.path.join(current_dir,'old_zip.txt'), 'w') as f:
    for item in tqdm.tqdm(filelist):
        name = os.path.split(item)[-1]
        md5 = calculate_md5(item)
        f.write("%s %s\n" % (name, md5))
######################################################

# prefex = 'custom_'
# filelist = glob(os.path.join(current_dir,'anim/dynamic/*.dyn'))

# for item in filelist:
#     name = os.path.split(item)[-1]
#     # print(name)
#     shutil.move(item, os.path.join(current_dir,f'anim/dynamic/{prefex}{name}'))

############################################################

# import zipfile
# filelist = glob(os.path.join(current_dir,'anim/dynamic/*.zip'))
# import tqdm
# for item in tqdm.tqdm(filelist):
#     name = "custom_"+os.path.split(item)[-1].split('.')[0]
#     extract_path = os.path.join(current_dir,f'anim/dynamic/{name}')
#     with zipfile.ZipFile(item, 'r') as zip_ref:
#         zip_ref.extractall(extract_path)

############################################################

# filelist = glob(os.path.join(current_dir,'anim/dynamic/*.zip'))
# for item in filelist:
#     os.remove(item)
#############################################################



# filelist = glob(os.path.join(current_dir,'anim/dynamic/*/build.bin'))
# import pyautogui
# import time
# import tqdm
# flag = False

# # while True:
# #     print(pyautogui.position())
# #     time.sleep(1)

# for item in tqdm.tqdm(filelist):
#     dirname = os.path.dirname(item)
#     name = os.path.split(dirname)[-1]
#     # if name == 'custom_anim_dog':
#     #     flag = True
#     # if not flag:
#     #     continue
#     pyautogui.click(1411, 302)
#     time.sleep(1)
#     pyautogui.click(1469, 278)
#     time.sleep(1)
#     pyautogui.typewrite(dirname)
#     pyautogui.typewrite('\n')
#     time.sleep(1)
#     pyautogui.click(1333, 730)
#     pyautogui.typewrite("build.bin")
#     pyautogui.click(1620, 773)
#     time.sleep(1)
#     pyautogui.click(1411, 352)
#     time.sleep(1)
#     pyautogui.click(1333, 730)
#     pyautogui.typewrite("build.bin")
#     pyautogui.click(1620, 773)
#     time.sleep(1)
#     pyautogui.click(1031, 535)
#     time.sleep(1)
#     pyautogui.click(1381, 404, 2)
#     pyautogui.typewrite(name)
#     pyautogui.click(1407, 436)
#     time.sleep(1)
#     pyautogui.click(971, 599)
#     time.sleep(1)

    
###########################################
# filelist = glob(os.path.join(current_dir,'anim/test/*'))
# # filelist = list(filter(lambda x: x[-3:] != "dyn", filelist))
# import tqdm
# import zipfile
# for item in tqdm.tqdm(filelist):
#     flst = glob(os.path.join(item,'*'))
#     name = os.path.split(item)[-1]
#     with zipfile.ZipFile(os.path.join(current_dir,"anim", "dynamic", f'{name}.zip'), 'w', zipfile.ZIP_DEFLATED) as zip_ref:
#         for f in flst:
#             zip_ref.write(f, os.path.split(f)[-1])

#####################################
# filelist = glob(os.path.join(current_dir,'anim/dynamic/*'))
# filelist = list(filter(lambda x: x[-3:] != "dyn" and  x[-3:] != "zip", filelist))
# for item in filelist:
#     shutil.rmtree(item)


#####################################
# old_file = {}
# with open(os.path.join(current_dir,'old_zip.txt'), 'r') as f:
#     for line in f.readlines():
#         name, md5 = line.split(" ")
#         name = name.strip()
#         md5 = md5.strip()
#         old_file[name] = md5

# new_file = {}
# with open(os.path.join(current_dir,'new_zip.txt'), 'r') as f:
#     for line in f.readlines():
#         name, md5 = line.split(" ")
#         name = name.strip()
#         md5 = md5.strip()
#         new_file[name] = md5

# print("new file:")
# print(len(new_file))
# print("old file:")
# print(len(old_file))
# filelist = glob(os.path.join(current_dir,'anim/dynamic/*.zip'))
# print(len(filelist))
###############################################
# diff_file = {}

# for k, v in new_file.items():
#     if v not in old_file.values():
#         diff_file[k] = v

# with open(os.path.join(current_dir,'diff_new_zip.txt'), 'w') as f:
#     for k, v in diff_file.items():
#         f.write("%s %s\n" % (k, v))

# print("diff new file:", len(diff_file))
# diff_file = {}

# for k, v in old_file.items():
#     if v not in new_file.values():
#         diff_file[k] = v

# with open(os.path.join(current_dir,'diff_old_zip.txt'), 'w') as f:
#     for k, v in diff_file.items():
#         f.write("%s %s\n" % (k, v))

# print("diff old file:", len(diff_file))

################################################################
# diff_new_file = {}
# with open(os.path.join(current_dir,'diff_new_zip.txt'), 'r') as f:
#     for line in f.readlines():
#         name, md5 = line.split(" ")
#         name = name.strip()
#         md5 = md5.strip()
#         diff_new_file[name] = md5

# diff_old_file = {}
# with open(os.path.join(current_dir,'diff_old_zip.txt'), 'r') as f:
#     for line in f.readlines():
#         name, md5 = line.split(" ")
#         name = name.strip()
#         md5 = md5.strip()
#         diff_old_file[name] = md5

# print("diff new file:", len(diff_new_file))
# for k, v in tqdm.tqdm(diff_new_file.items()):
#     k = "custom_"+k
#     try:
#         os.remove(os.path.join(current_dir, 'anim', 'dynamic', k))
#     except:
#         print(k, "not exist")
#     else:
#         print(k, "########################remove success")

# print("diff old file:", len(diff_old_file))
# for k, v in tqdm.tqdm(diff_old_file.items()):
#     k = "custom_"+k
#     try:
#         os.remove(os.path.join(current_dir, 'anim', 'dynamic', k))
#     except:
#         print(k, "not exist")
#     else:
#         print(k, "########################remove success")


################################################
# ori = r"D:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\data\databundles\anim\dynamic"
# dest = r"D:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\mods\test\anim\new"
# diff_new_file = {}
# with open(os.path.join(current_dir,'diff_new_zip.txt'), 'r') as f:
#     for line in f.readlines():
#         name, md5 = line.split(" ")
#         name = name.strip()
#         md5 = md5.strip()
#         diff_new_file[name] = md5
# for k, v in tqdm.tqdm(diff_new_file.items()):
#     nk = "custom_"+k
#     shutil.copy(os.path.join(ori, k), os.path.join(dest, nk))

#############################################
# import zipfile
# filelist = glob(os.path.join(current_dir,'anim/new/*.zip'))
# for item in tqdm.tqdm(filelist):
#     name = os.path.split(item)[-1].split('.')[0]
#     extract_path = os.path.join(current_dir,f'anim/new/{name}')
#     with zipfile.ZipFile(item, 'r') as zip_ref:
#         zip_ref.extractall(extract_path)
# filelist = glob(os.path.join(current_dir,'anim/new/*.zip'))
# for item in filelist:
#     os.remove(item)


##############################################################


# filelist = glob(os.path.join(current_dir,'anim/new/*/build.bin'))
# import pyautogui
# import time
# import tqdm
# flag = False

# # while True:
# #     print(pyautogui.position())
# #     time.sleep(1)

# for item in tqdm.tqdm(filelist):
#     dirname = os.path.dirname(item)
#     name = os.path.split(dirname)[-1]
#     pyautogui.click(1331, 536)   # 源文件夹
#     time.sleep(1)
#     pyautogui.click(1316, 532)  # 输入
#     time.sleep(1)
#     pyautogui.typewrite(dirname)
#     pyautogui.typewrite('\n')
#     time.sleep(1)
#     pyautogui.click(1326, 944)
#     pyautogui.typewrite("build.bin")
#     pyautogui.click(1487, 971)
#     time.sleep(1)
#     pyautogui.click(1334, 579)
#     time.sleep(1)
#     pyautogui.click(1326, 944)
#     pyautogui.typewrite("build.bin")
#     pyautogui.click(1487, 971)
#     time.sleep(1)
#     pyautogui.click(1018, 533)
#     time.sleep(1)
#     pyautogui.click(1311, 616, 2)
#     pyautogui.typewrite(name)
#     pyautogui.click(1316, 639)
#     time.sleep(1)
#     pyautogui.click(968, 595)
#     time.sleep(1)


###############################################

# filelist = glob(os.path.join(current_dir,'anim/new/*'))
# # filelist = list(filter(lambda x: x[-3:] != "dyn", filelist))
# import tqdm
# import zipfile
# for item in tqdm.tqdm(filelist):
#     flst = glob(os.path.join(item,'*'))
#     name = os.path.split(item)[-1]
#     with zipfile.ZipFile(os.path.join(current_dir,"anim", "new", f'{name}.zip'), 'w', zipfile.ZIP_DEFLATED) as zip_ref:
#         for f in flst:
#             zip_ref.write(f, os.path.split(f)[-1])
###############################################
