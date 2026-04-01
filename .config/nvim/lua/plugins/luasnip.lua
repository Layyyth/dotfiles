-- =============================================================================
-- LuaSnip Configuration
-- =============================================================================
local luasnip = require("luasnip")

-- Load friendly-snippets
require("friendly-snippets")

-- Setup
luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

-- Keymaps for jumping between snippets
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })

-- Add Python-specific snippets for FastAPI & PyTorch
local python_snippets = luasnip.snippet("python", {
  luasnip.snippet_node("fastapi_app", {
    luasnip.text_node({
      "from fastapi import FastAPI",
      "from pydantic import BaseModel",
      "",
      "app = FastAPI()",
      "",
      "",
      "@app.get(\"/\")",
      "def read_root():",
      "    return {\"message\": \"Hello World\"}",
    }),
  }),
  luasnip.snippet_node("pytorch_model", {
    luasnip.text_node({
      "import torch",
      "import torch.nn as nn",
      "",
      "",
      "class Model(nn.Module):",
      "    def __init__(self, input_size, hidden_size, output_size):",
      "        super(Model, self).__init__()",
      "        self.layer1 = nn.Linear(input_size, hidden_size)",
      "        self.relu = nn.ReLU()",
      "        self.layer2 = nn.Linear(hidden_size, output_size)",
      "",
      "    def forward(self, x):",
      "        x = self.layer1(x)",
      "        x = self.relu(x)",
      "        x = self.layer2(x)",
      "        return x",
    }),
  }),
  luasnip.snippet_node("transformer_model", {
    luasnip.text_node({
      "import torch",
      "import torch.nn as nn",
      "from transformers import AutoModel",
      "",
      "",
      "class TransformerClassifier(nn.Module):",
      "    def __init__(self, model_name, num_labels):",
      "        super(TransformerClassifier, self).__init__()",
      "        self.transformer = AutoModel.from_pretrained(model_name)",
      "        self.dropout = nn.Dropout(0.1)",
      "        self.classifier = nn.Linear(768, num_labels)",
      "",
      "    def forward(self, input_ids, attention_mask):",
      "        outputs = self.transformer(",
      "            input_ids=input_ids,",
      "            attention_mask=attention_mask",
      "        )",
      "        pooled_output = outputs.last_hidden_state[:, 0, :]",
      "        x = self.dropout(pooled_output)",
      "        x = self.classifier(x)",
      "        return x",
    }),
  }),
  luasnip.snippet_node("dataclass", {
    luasnip.text_node({
      "from dataclasses import dataclass",
      "",
      "",
      "@dataclass",
      "class Config:",
      "    model_name: str = \"bert-base-uncased\"",
      "    batch_size: int = 32",
      "    learning_rate: float = 1e-4",
      "    num_epochs: int = 10",
    }),
  }),
})

-- Register Python snippets
 luasnip.snippets = {
  python = python_snippets,
}
