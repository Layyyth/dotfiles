-- =============================================================================
-- FastAPI & Python Snippets
-- =============================================================================
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

-- Python common patterns
ls.add_snippets("python", {
  -- FastAPI app
  s("fastapi_app", {
    t("from fastapi import FastAPI, HTTPException"),
    t({ "", "from pydantic import BaseModel" }),
    t({ "", "" }),
    t("app = FastAPI()" ),
    t({ "", "" }),
    t("@app.get(\"/\")"),
    t({ "def read_root():", "    return {\"message\": \"Hello World\"}" }),
  }),
  -- FastAPI model
  s("fastapi_model", {
    t("class "),
    i(1, "Item"),
    t("(BaseModel):"),
    t({ "", "    "}),
    i(2, "name"),
    t(": str"),
    t({ "", "    "}),
    i(3, "description"),
    t(": str | None = None"),
  }),
  -- FastAPI endpoint
  s("fastapi_endpoint", {
    t("@app."),
    c(1, { t("get"), t("post"), t("put"), t("delete") }),
    t("(\"/"),
    i(2, "endpoint"),
    t("\")"),
    t({ "", "def " }),
    i(3, "function_name"),
    t("("),
    i(4, "param"),
    t(": "),
    i(5, "str"),
    t("):"),
    t({ "", "    " }),
    i(0),
  }),
  -- Pydantic model
  s("pydantic_model", {
    t("class "),
    i(1, "ModelName"),
    t("(BaseModel):"),
    t({ "", "    " }),
    i(2, "field"),
    t(": "),
    i(3, "str"),
  }),
  -- SQLAlchemy model
  s("sqlalchemy_model", {
    t("class "),
    i(1, "User"),
    t("(Base):"),
    t({ "", "    __tablename__ = \"" }),
    i(2, "users"),
    t("\""),
    t({ "", "    " }),
    i(3, "id"),
    t(" = Column(Integer, primary_key=True, index=True)"),
    t({ "", "    " }),
    i(4, "name"),
    t(" = Column(String)"),
  }),
  -- main function
  s("main_py", {
    t({ "if __name__ == \"__main__\":", "    " }),
    i(0, "main()"),
  }),
  -- async main
  s("async_main", {
    t({ "async def main():", "    " }),
    i(0),
    t({ "", "" }),
    t({ "if __name__ == \"__main__\":", "    import uvicorn" }),
    t({ "    uvicorn.run(app, host=\"0.0.0.0\", port=8000)" }),
  }),
  -- pytest test
  s("pytest_test", {
    t("def test_"),
    i(1, "name"),
    t("():"),
    t({ "", "    " }),
    i(0),
  }),
  -- pytest async test
  s("pytest_async", {
    t({ "import pytest", "" }),
    t("@pytest.mark.asyncio"),
    t("async def test_"),
    i(1, "name"),
    t("():"),
    t({ "", "    " }),
    i(0),
  }),
})

-- Go snippets
ls.add_snippets("go", {
  s("go_main", {
    t("package main"),
    t({ "", "" }),
    t("func main() {"),
    t({ "", "    " }),
    i(0),
    t({ "", "}" }),
  }),
  s("go_handler", {
    t("func "),
    i(1, "handler"),
    t("(w http.ResponseWriter, r *http.Request) {"),
    t({ "", "    " }),
    i(0),
    t({ "", "}" }),
  }),
})

-- C snippets
ls.add_snippets("c", {
  s("c_main", {
    t({ "#include <stdio.h>", "" }),
    t({ "int main(int argc, char *argv[]) {", "    " }),
    i(0),
    t({ "", "    return 0;", "}" }),
  }),
  s("c_func", {
    t("void "),
    i(1, "function_name"),
    t("(void) {"),
    t({ "", "    " }),
    i(0),
    t({ "", "}" }),
  }),
})
