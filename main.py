import json


def app1_version():
    try:
        f = open('version_app1.json',)
        version = json.load(f)
        # Closing file
        f.close()

        print(f"APP1 STARTED {version['x']}.{version['y']}.{version['z']}.{version['p']}")
    except Exception as e:
        # raise e
        print ("Hay un problema con la version app1")
def app2_version():
    try:
        f = open('version_app2.json',)
        version = json.load(f)
        # Closing file
        f.close()

        print(f"APP2 STARTED {version['x']}.{version['y']}.{version['z']}.{version['p']}")
    except Exception as e:
        # raise e
        print ("Hay un problema con la version app2")
def main():
    app1_version()
    app2_version()

if __name__ == "__main__":
    main()