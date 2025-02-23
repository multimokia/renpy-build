from renpybuild.context import Context
from renpybuild.task import task

@task(platforms="all")
def build(c: Context):
    c.clean()

    c.var("sqlite_zip", "sqlite-amalgamation-3490100.zip")
    c.var("sqlite_dir", "sqlite-amalgamation-3490100")

    c.var("sqlite", c.path("{{ root }}/_sqlite"))

    if not c.path("{{ tars }}/{{ sqlite_zip }}").exists():
        return

    c.run("unzip -q {{ tars }}/{{ sqlite_zip }}")

    c.rmtree("{{ install }}/_sqlite")
    c.run("mv {{ sqlite_dir }} {{ install }}/_sqlite")
